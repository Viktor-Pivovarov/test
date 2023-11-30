// ignore_for_file: always_specify_types, lines_longer_than_80_chars, strict_raw_type, avoid_dynamic_calls

import 'dart:async';

class _QueuedFuture<T> {
  _QueuedFuture(
    this.closure,
    this.completer,
    this.timeout, {
    this.onComplete,
  });

  final Completer<dynamic> completer;
  final Future<T> Function() closure;
  final Duration? timeout;
  Function? onComplete;

  bool _timedOut = false;

  Future<void> execute() async {
    try {
      T result;
      Timer? timeoutTimer;

      if (timeout != null) {
        timeoutTimer = Timer(timeout!, () {
          _timedOut = true;
          if (onComplete != null) {
            onComplete?.call();
          }
        });
      }
      result = await closure();
      if (result != null) {
        completer.complete(result);
      } else {
        completer.complete(null);
      }

      //Make sure not to execute the next command until this future has completed
      timeoutTimer?.cancel();
      await Future.microtask(() {});
    } catch (e) {
      completer.completeError(e);
    } finally {
      if (onComplete != null && !_timedOut) onComplete?.call();
    }
  }
}

/// Queue to execute Futures in order.
/// It awaits each future before executing the next one.
class CustomQueue {
  CustomQueue({this.delay, this.parallel = 1, this.timeout});
  final List<_QueuedFuture> _nextCycle = [];

  /// A delay to await between each future.
  final Duration? delay;

  /// A timeout before processing the next item in the queue
  final Duration? timeout;

  /// The number of items to process at one time
  ///
  /// Can be edited mid processing
  int parallel;
  int _lastProcessId = 0;
  bool _isCancelled = false;

  bool get isCancelled => _isCancelled;
  StreamController<int>? _remainingItemsController;

  Stream<int> get remainingItems {
    // Lazily create the remaining items controller so if people aren't listening to the stream, it won't create any potential memory leaks.
    // Probably not necessary, but hey, why not?
    _remainingItemsController ??= StreamController<int>();
    return _remainingItemsController!.stream.asBroadcastStream();
  }

  final List<Completer<void>> _completeListeners = [];

  /// Resolve when all items are complete
  ///
  /// Returns a future that will resolve when all items in the queue have
  /// finished processing
  Future get onComplete {
    final Completer completer = Completer<dynamic>();
    _completeListeners.add(completer);
    return completer.future;
  }

  // @Deprecated(
  //     'v4 - listen to the [remainingItems] stream to listen to queue status')
  Set<int> activeItems = {};

  /// Cancels the queue. Also cancels any unprocessed items throwing a [QueueCancelledException]
  ///
  /// Subsquent calls to [add] will throw.
  void cancel() {
    for (final _QueuedFuture item in _nextCycle) {
      item.completer.completeError(QueueCancelledException());
    }
    _nextCycle.removeWhere((_QueuedFuture item) => item.completer.isCompleted);
    _isCancelled = true;
  }

  /// Dispose of the queue
  ///
  /// This will run the [cancel] function and close the remaining items stream
  /// To gracefully exit the queue, waiting for items to complete first,
  /// call `await [Queue.onComplete];` before disposing
  void dispose() {
    _remainingItemsController?.close();
    cancel();
  }

  /// Adds the future-returning closure to the queue.
  ///
  /// It will be executed after futures returned
  /// by preceding closures have been awaited.
  ///
  /// Will throw an exception if the queue has been cancelled.
  Future<T> add<T>(Future<T> Function() closure) {
    if (isCancelled) throw QueueCancelledException();
    final Completer<T> completer = Completer<T>();
    _nextCycle.add(_QueuedFuture<T>(closure, completer, timeout));
    _updateRemainingItems();
    unawaited(_process());
    return completer.future;
  }

  /// Handles the number of parallel tasks firing at any one time
  ///
  /// It does this by checking how many streams are running by querying active
  /// items, and then if it has less than the number of parallel operations fire off another stream.
  ///
  /// When each item completes it will only fire up one other process
  ///
  Future<void> _process() async {
    if (activeItems.length < parallel) {
      _queueUpNext();
    }
  }

  void _updateRemainingItems() {
    final StreamController<int>? remainingItemsController =
        _remainingItemsController;
    if (remainingItemsController != null &&
        remainingItemsController.isClosed == false) {
      remainingItemsController.sink.add(_nextCycle.length + activeItems.length);
    }
  }

  void _queueUpNext() {
    if (_nextCycle.isNotEmpty &&
        !isCancelled &&
        activeItems.length <= parallel) {
      final int processId = _lastProcessId;
      activeItems.add(processId);
      final _QueuedFuture item = _nextCycle.first;
      _lastProcessId++;
      _nextCycle.remove(item);
      item.onComplete = () async {
        activeItems.remove(processId);
        if (delay != null) {
          await Future<void>.delayed(delay!);
        }
        _updateRemainingItems();
        _queueUpNext();
      };
      unawaited(item.execute());
    } else if (activeItems.isEmpty && _nextCycle.isEmpty) {
      //Complete
      for (final Completer<void> completer in _completeListeners) {
        if (completer.isCompleted != true) {
          completer.complete();
        }
      }
      _completeListeners.clear();
    }
  }
}

class QueueCancelledException implements Exception {}

// Don't throw analysis error on unawaited future.
void unawaited(Future<void> future) {}

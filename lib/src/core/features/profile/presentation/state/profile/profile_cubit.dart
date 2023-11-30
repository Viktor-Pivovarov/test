import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class UpdateUser {}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ProfileRouter router,
    required ProfileRepository repository,
    required NotifyService notifyService,
    required GeoLocationRouter geoLocationRouter,
    required DictRepository dictRepository,
    required EventBus eventBus,
    required this.authManager,
  })  : _router = router,
        _repository = repository,
        _notifyService = notifyService,
        _geoLocationRouter = geoLocationRouter,
        _dictRepository = dictRepository,
        _eventBus = eventBus,
        super(ProfileState(user: authManager.user)) {
    _stream = authManager.currentUser.listen(_listenAuth);

    _updateStream = _eventBus.on<UpdateUser>().listen((event) {
      _repository.getUserInfo();
    });
  }

  final NotifyService _notifyService;

  final ProfileRouter _router;

  final EventBus _eventBus;

  final GeoLocationRouter _geoLocationRouter;

  final ProfileRepository _repository;

  final AuthManager<AuthenticatedUser> authManager;

  final DictRepository _dictRepository;

  final StreamController<SwipeRefreshState> _controller =
      StreamController<SwipeRefreshState>.broadcast();

  final maxInterests = 9;

  StreamSubscription<AuthenticatedUser>? _stream;

  StreamSubscription<UpdateUser>? _updateStream;

  Stream<SwipeRefreshState> get refreshStream => _controller.stream;

  Future<void> onRefresh() async {
    await authManager.verify();
    _controller.sink.add(SwipeRefreshState.hidden);
  }

  Future<void> init() async {
    final languagesResult = await _dictRepository.getLanguages();

    languagesResult.fold(Left.new, (r) {
      emit(state.copyWith(languages: r));
    });

    final interestsResult = await _dictRepository.getInterests();

    interestsResult.fold(Left.new, (r) {
      emit(state.copyWith(interests: r));
    });
  }

  void _listenAuth(AuthenticatedUser user) {
    emit(state.copyWith(user: user));
  }

  @override
  Future<void> close() {
    _stream?.cancel();
    _updateStream?.cancel();

    return super.close();
  }

  Future<void> onPressedPhotos() async {
    if (Platform.isIOS) {
      final permissionResult = await Permission.photos.request();
      if (permissionResult.isDenied || permissionResult.isPermanentlyDenied) {
        final result = await const PermissionDialog().show();

        if (result ?? false) {
          await openAppSettings();
          return;
        } else {
          return;
        }
      }
    }

    _router.goToPhotos();
  }

  void _setLoading() {
    emit(state.copyWith(status: StateStatus.fetchingInProgress, error: null));
  }

  void _setError(Failure error) {
    _notifyService.showError(error.message ?? error.getLocalizedString());

    emit(state.copyWith(status: StateStatus.fetchingFailure));
  }

  void _setSuccess() {
    // _notifyService.showSuccess(message ?? ProfileI18n.successSaveData);

    emit(state.copyWith(status: StateStatus.fetchingSuccess));
  }

  void onPressedBirthTime() {
    _router.goToEditBirthTime();
  }

  Future<void> onPressedBirthLocation() async {
    final geoLocation = await _geoLocationRouter.goToGeoLocation();

    if (geoLocation != null) {
      _setLoading();

      final result = await _repository.updateCityBorn(
        LocationModel(
          coordinate: CoordinateModel(
            latitude: geoLocation.latitude,
            longitude: geoLocation.longitude,
          ),
          city: geoLocation.name,
        ),
      );

      result.fold(_setError, (r) => _setSuccess());
    }
  }

  Future<void> updateFirstName(String value) async {
    _setLoading();

    final result = await _repository.updateFirstName(value);

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveBirthday(DateTime value) async {
    _setLoading();

    final result = await _repository.updateBirthday(value);

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveLanguages(List<int> value) async {
    _setLoading();

    final result = await _repository.updateLanguages(
      state.languages.where((element) => value.contains(element.id)).toList(),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveBirthTime(String value) async {
    _setLoading();

    final result = await _repository.updateBirthTime(value);

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveAboutMe(String value) async {
    _setLoading();

    final result = await _repository.updateAboutMe(value);

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveInterest(List<DictModel> value) async {
    _setLoading();

    final result = await _repository.updateInterests(value);

    result.fold(_setError, (r) {
      _setSuccess();
    });
  }

  void onPressedInterest(DictModel item) {
    List<DictModel> interests = [...state.profile.interests];

    if (state.profile.interests.contains(item)) {
      interests = interests.whereNot((element) => element == item).toList();
    } else if (state.profile.interests.length < maxInterests) {
      interests.add(item);
    }

    emit(
      state.copyWith(
        user: state.user.copyWith(
          profile: state.user.profile.copyWith(
            interests: [...interests],
          ),
        ),
      ),
    );
  }

  void onPressedAboutMe() {
    _router.goToAboutMe();
  }

  void onPressedQuestionnaire(QuestionnaireEnum value) {
    _router.goToQuestionnaire(question: value.name);
  }

  void onPressedMyInterests() {
    _router.goToInterests();
  }

  Future<void> onPressedLanguages() async {
    final List<int>? result = await LanguagesDialog.showDialog(
      _router.context,
      state.profile.languages.map((e) => e.id).toList().join(','),
    );

    if (result != null) {
      await onPressedSaveLanguages(result);
    }
  }
}

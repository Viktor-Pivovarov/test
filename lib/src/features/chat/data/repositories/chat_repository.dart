import 'package:jojo/src/features/chat/_chat.dart';
import 'package:xander9112/xander9112.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRepositoryImpl(this._dataSource);

  final ChatDataSource _dataSource;

  @override
  Future<Either<Failure, void>> blockChat(String id) async {
    try {
      final response = await _dataSource.blockChat(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteChat(String id) async {
    try {
      final response = await _dataSource.deleteChat(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ChatDTO>> getChat(String id) async {
    try {
      final response = await _dataSource.getChat(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponseChatsDTO>> getChats() async {
    try {
      final response = await _dataSource.getChats();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> chatNotificationAccept(String id) async {
    try {
      final response = await _dataSource.chatNotificationAccept(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> chatNotificationDecline(String id) async {
    try {
      final response = await _dataSource.chatNotificationDecline(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ResponsePendingChatsDTO>> getChatsPending() async {
    try {
      final response = await _dataSource.getChatsPending();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, SendChatMessageResponseDTO>> sendMessage(
    String id,
    String message,
  ) async {
    try {
      final response = await _dataSource.sendMessage(id, message);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        ChatFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(ChatFailure(code: 1, message: error.toString()));
    }
  }
}

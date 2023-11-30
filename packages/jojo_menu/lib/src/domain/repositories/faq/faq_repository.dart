import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

abstract class FaqRepository {
  Future<Either<Failure, FaqModel>> getFaq();

  Stream<FaqModel> subscribe();
}

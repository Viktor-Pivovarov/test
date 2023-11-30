import 'package:jojo_menu/src/_menu.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class MenuRepository {
  Future<Either<Failure, MenuModel>> getMenu();
}

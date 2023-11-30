import 'package:jojo_menu/src/_menu.dart';

// ignore: one_member_abstracts
abstract class MenuDataSource {
  Future<MenuModel> getMenu();
}

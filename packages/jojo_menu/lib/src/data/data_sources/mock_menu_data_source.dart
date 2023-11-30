import 'package:jojo_menu/src/_menu.dart';

class MockMenuDataSource implements MenuDataSource {
  @override
  Future<MenuModel> getMenu() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    return const MenuModel(title: 'New Menu');
  }
}

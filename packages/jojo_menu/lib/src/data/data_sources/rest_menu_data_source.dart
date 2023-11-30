import 'package:dio/dio.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_menu_data_source.g.dart';

@RestApi()
abstract class RestMenuDataSource implements MenuDataSource {
  factory RestMenuDataSource(Dio dio, {String baseUrl}) = _RestMenuDataSource;

  @override
  @GET('/menu')
  Future<MenuModel> getMenu();
}

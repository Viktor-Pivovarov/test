import 'package:dio/dio.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_dating_info_datasource.g.dart';

@RestApi()
abstract class RemoteDatingInfoDataSource {
  factory RemoteDatingInfoDataSource(Dio dio, {String baseUrl}) =
      _RemoteDatingInfoDataSource;

  @GET(MenuApiMethods.datingInfo)
  Future<DatingInfoModel> getDatingInfo();
}

import 'package:dio/dio.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_tariff_datasource.g.dart';

@RestApi()
abstract class RemoteTariffDataSource {
  factory RemoteTariffDataSource(Dio dio, {String baseUrl}) =
      _RemoteTariffDataSource;

  @GET(MenuApiMethods.tariffs)
  Future<TariffsDto> getTariffs();
}

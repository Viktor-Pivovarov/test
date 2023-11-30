import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_liked_data_source.g.dart';

@RestApi()
abstract class RestLikedDataSource implements LikedDataSource {
  factory RestLikedDataSource(Dio dio, {String baseUrl}) = _RestLikedDataSource;

  @override
  @GET(LikedApiMethods.stackOffers)
  Future<OffersResponseDTO> getOffers({@Query('sort') String? sort});

  @override
  @GET(LikedApiMethods.datingInfo)
  Future<DatingInfoModel> getDatingInfo();

  @override
  @PUT(LikedApiMethods.view)
  Future<void> updateIsNew(@Path() int id);
}

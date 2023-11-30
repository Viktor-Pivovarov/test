import 'package:dio/dio.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_selection_data_source.g.dart';

@RestApi(
    // parser: Parser.FlutterCompute,
    )
abstract class RestSelectionDataSource implements SelectionDataSource {
  factory RestSelectionDataSource(Dio dio, {String baseUrl}) =
      _RestSelectionDataSource;

  @override
  @GET('/v1/personal/selection-info')
  Future<SelectionInfoDTO> getSelectionInfo();

  @override
  @GET('/v1/stack-offers')
  Future<OffersResponseDTO> getOffers();

  @override
  @GET('/v1/offers/{id}')
  Future<OfferEntity> getOffer(@Path() int id);

  @override
  @PUT('/v1/offers/{id}/accept')
  Future<void> acceptOffer(@Path() int id);

  @override
  @PUT('/v1/offers/{id}/decline')
  Future<void> declineOffer(@Path() int id);

  @override
  @POST('/v1/offers/{id}/block')
  Future<void> block(@Path() int id, [@Field('reasons') List<int>? ids]);

  @override
  @GET('/v1/personal/search-preferences')
  Future<SearchPreferencesDTO> getSearchPreferences();

  @override
  @POST('/v1/personal/cabinet/preference-languages')
  Future<void> updatePreferenceLanguages(@Field('languages') List<int> ids);

  @override
  @POST('/v1/personal/cabinet/distance')
  Future<void> updateDistance(@Field('distance') int value);

  @override
  @POST('/v1/personal/cabinet/preference-search-age')
  Future<void> updateSearchAge(
    @Field('ageFrom') int ageFrom,
    @Field('ageTo') int ageTo,
  );
}

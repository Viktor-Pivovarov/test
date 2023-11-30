import 'package:jojo/src/features/selection/_selection.dart';

// ignore: one_member_abstracts
abstract class SelectionDataSource {
  Future<SelectionInfoDTO> getSelectionInfo();

  Future<OffersResponseDTO> getOffers();

  Future<OfferEntity> getOffer(int id);

  Future<void> acceptOffer(int id);

  Future<void> declineOffer(int id);

  Future<SearchPreferencesDTO> getSearchPreferences();

  Future<void> updatePreferenceLanguages(List<int> ids);

  Future<void> block(int id, [List<int>? ids]);

  Future<void> updateDistance(int value);

  Future<void> updateSearchAge(int ageFrom, int ageTo);
}

import 'package:jojo/src/features/selection/_selection.dart';
import 'package:xander9112/xander9112.dart';

abstract class SelectionRepository {
  Future<Either<Failure, SelectionInfoDTO>> getSelection();

  Future<Either<Failure, List<OfferListItemEntity>>> getOffers();

  Future<Either<Failure, OfferEntity>> getOffer(int id);

  Future<Either<Failure, void>> acceptOffer(int id);

  Future<Either<Failure, void>> declineOffer(int id);

  Future<Either<Failure, SearchPreferencesDTO>> getSearchPreferences();

  Future<Either<Failure, void>> updatePreferenceLanguages(List<int> ids);

  Future<Either<Failure, void>> updateDistance(int value);

  Future<Either<Failure, void>> updateSearchAge(int ageFrom, int ageTo);

  Future<Either<Failure, void>> block(int id, [List<int>? ids]);
}

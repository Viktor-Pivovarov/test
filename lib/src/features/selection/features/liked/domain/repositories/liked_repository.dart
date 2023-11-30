import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class LikedRepository {
  Future<Either<Failure, OffersResponseDTO>> getOffers({
    String sortBy,
    String direction,
  });

  Future<Either<Failure, DatingInfoModel>> getDatingInfo();

  Future<Either<Failure, void>> updateIsNew(int id);
}

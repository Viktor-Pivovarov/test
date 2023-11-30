import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';

// ignore: one_member_abstracts
abstract class LikedDataSource {
  Future<OffersResponseDTO> getOffers({String? sort});
  Future<DatingInfoModel> getDatingInfo();
  Future<void> updateIsNew(int id);
}

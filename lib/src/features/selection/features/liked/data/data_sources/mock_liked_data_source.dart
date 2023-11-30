import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';

class MockLikedDataSource implements LikedDataSource {
  @override
  Future<OffersResponseDTO> getOffers({String? sort}) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    return const OffersResponseDTO(
      items: [
        OfferListItemEntity(
          id: 0,
          isNew: true,
          candidate: CandidateListItemEntity(
            name: 'Юлия',
            age: 25,
            photos: [
              'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
            ],
          ),
          compatibility: OfferEntityCompatibility(value: 1, maxValue: 1),
          distance: 1,
        ),
        OfferListItemEntity(
          id: 1,
          candidate: CandidateListItemEntity(
            name: 'Анна',
            age: 25,
            photos: [
              'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
            ],
          ),
          compatibility: OfferEntityCompatibility(value: 1, maxValue: 1),
          distance: 1,
        ),
        OfferListItemEntity(
          id: 1,
          candidate: CandidateListItemEntity(
            name: 'Анна',
            age: 25,
            photos: [
              'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
              'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
            ],
          ),
          compatibility: OfferEntityCompatibility(value: 1, maxValue: 1),
          distance: 1,
        ),
      ],
    );
  }

  @override
  Future<DatingInfoModel> getDatingInfo([
    String? sortBy,
    String? direction,
  ]) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    return const DatingInfoModel(
      balance: 10,
      totalCandidates: 100,
      mutualSympathy: 20,
      youSaidNo: 15,
      youLiked: 50,
      newLikesMe: 2,
      likesMe: 333,
    );
  }

  @override
  Future<void> updateIsNew(int id) async {}
}

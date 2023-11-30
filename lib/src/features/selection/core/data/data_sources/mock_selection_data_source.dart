import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class MockSelectionDataSource implements SelectionDataSource {
  @override
  Future<SelectionInfoDTO> getSelectionInfo() async {
    return Future<SelectionInfoDTO>.delayed(const Duration(seconds: 1), () {
      return const SelectionInfoDTO(
        datingState: DatingDisplayState.candidatesWasFound,
      );
    });
  }

  @override
  Future<OfferEntity> getOffer(int id) {
    return Future<OfferEntity>.delayed(const Duration(seconds: 2), () {
      return const OfferEntity(
        id: 0,
        distance: 500,
        compatibility: OfferEntityCompatibility(value: 29, maxValue: 36),
        candidate: CandidateEntity(
          zodiac: ZodiacEnum.taurus,
          name: 'Юлия',
          age: 25,
          height: 180,
          bio:
              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actua...',
          photos: [
            'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
            'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
            'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
          ],
          biometrics: [DictModel(id: 0, name: '')],
          alcoholStatus: DictModel(
            id: 1,
            name: 'Это не для меня',
          ),
          covid: DictModel(
            id: 1,
            name: 'Нет прививки',
          ),
          education: DictModel(
            id: 1,
            name: 'Магистратура',
          ),
          familyPlan: DictModel(
            id: 1,
            name: 'Я хочу детей',
          ),
          foodPreference: DictModel(
            id: 1,
            name: 'Ем всё',
          ),
          idealMeetingPoints: [
            DictModel(
              id: 1,
              name: 'Ресторан',
            ),
            DictModel(
              id: 2,
              name: 'Боулинг',
            ),
          ],
          interests: [
            DictModel(
              id: 1,
              name: 'Велосипед',
            ),
            DictModel(
              id: 3,
              name: 'Медитация',
            ),
          ],
          languages: [
            DictModel(
              id: 1,
              name: 'Венгерский',
            ),
            DictModel(
              id: 2,
              name: 'Датский',
            ),
          ],
          pets: [
            DictModel(
              id: 1,
              name: 'Кошка',
            ),
            DictModel(
              id: 2,
              name: 'Кролик',
            ),
          ],
          professionalStatus: DictModel(
            id: 1,
            name: 'Руководитель высшего звена',
          ),
          religion: DictModel(
            id: 1,
            name: 'Православие',
          ),
          sleepHabit: DictModel(
            id: 1,
            name: 'Жаворонок',
          ),
          smokeStatus: DictModel(
            id: 1,
            name: 'Не курю',
          ),
          workout: DictModel(
            id: 1,
            name: 'Часто',
          ),
        ),
      );
    });
  }

  @override
  Future<OffersResponseDTO> getOffers() {
    return Future<OffersResponseDTO>.delayed(const Duration(seconds: 1), () {
      return const OffersResponseDTO(
        items: [
          OfferListItemEntity(
            id: 0,
            distance: 500,
            compatibility: OfferEntityCompatibility(value: 0, maxValue: 50),
            candidate: CandidateListItemEntity(
              name: 'Юлия',
              age: 25,
              photos: [
                'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
              ],
            ),
          ),
          OfferListItemEntity(
            id: 1,
            datingState: OfferStatus.mutualAttraction,
            distance: 500,
            compatibility: OfferEntityCompatibility(value: 0, maxValue: 50),
            candidate: CandidateListItemEntity(
              name: 'Анна',
              age: 25,
              photos: [
                'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
              ],
            ),
          ),
          OfferListItemEntity(
            id: 2,
            datingState: OfferStatus.waitingForCandidate,
            distance: 500,
            compatibility: OfferEntityCompatibility(value: 0, maxValue: 50),
            candidate: CandidateListItemEntity(
              name: 'Анна',
              age: 25,
              photos: [
                'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
              ],
            ),
          ),
          OfferListItemEntity(
            id: 3,
            datingState: OfferStatus.youAreLiked,
            distance: 500,
            compatibility: OfferEntityCompatibility(value: 0, maxValue: 50),
            candidate: CandidateListItemEntity(
              name: 'Анна',
              age: 25,
              photos: [
                'https://cdn.discordapp.com/attachments/1136644635645710478/1139662502477701260/uxbrain_The_girl_in_your_dreams_c8dc5060-d21a-43c8-937e-ca84f7060163.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1138017623989301279/uxbrain_a_young_white_european_smiling_male_person_in_full-leng_ede9473e-d880-4221-8719-a2e73a93ea61.png',
                'https://cdn.discordapp.com/attachments/1136644635645710478/1137484719399915530/uxbrain_a_white_european_male_person_with_black_elvice_hairs_we_90c9a641-8315-4e08-b1ec-a921fef4d4a5.png',
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Future<void> acceptOffer(int id) {
    // TODO: implement acceptOffer
    throw UnimplementedError();
  }

  @override
  Future<void> declineOffer(int id) {
    // TODO: implement declineOffer
    throw UnimplementedError();
  }

  @override
  Future<SearchPreferencesDTO> getSearchPreferences() {
    // TODO: implement getSearchPreferences
    throw UnimplementedError();
  }

  @override
  Future<void> updatePreferenceLanguages(List<int> ids) {
    // TODO: implement updatePreferenceLanguages
    throw UnimplementedError();
  }

  @override
  Future<void> block(int id, [List<int>? ids]) {
    // TODO: implement block
    throw UnimplementedError();
  }

  @override
  Future<void> updateDistance(int value) {
    // TODO: implement updateDistance
    throw UnimplementedError();
  }

  @override
  Future<void> updateSearchAge(int ageFrom, int ageTo) {
    // TODO: implement updateSearchAge
    throw UnimplementedError();
  }
}

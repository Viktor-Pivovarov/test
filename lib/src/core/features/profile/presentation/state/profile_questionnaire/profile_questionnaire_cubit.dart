import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'profile_questionnaire_state.dart';
part 'profile_questionnaire_cubit.freezed.dart';

class ProfileQuestionnaireCubit extends BaseCubit<ProfileQuestionnaireState> {
  ProfileQuestionnaireCubit({
    required ProfileRepository repository,
    required DictRepository dictRepository,
    required NotifyService notifyService,
    required this.authManager,
  })  : _repository = repository,
        _dictRepository = dictRepository,
        _notifyService = notifyService,
        super(ProfileQuestionnaireState(user: authManager.user)) {
    init();
  }

  final AuthManager<AuthenticatedUser> authManager;

  final ProfileRepository _repository;

  final NotifyService _notifyService;

  final DictRepository _dictRepository;

  Future<void> init() async {
    final alcoholStatusesResult = await _dictRepository.getAlcoholStatuses();

    alcoholStatusesResult.fold(Left.new, (r) {
      emit(state.copyWith(alcoholStatuses: r));
    });

    final educationsResult = await _dictRepository.getEducations();

    educationsResult.fold(Left.new, (r) {
      emit(state.copyWith(educations: r));
    });

    final familyPlansResult = await _dictRepository.getFamilyPlans();

    familyPlansResult.fold(Left.new, (r) {
      emit(state.copyWith(familyPlans: r));
    });

    final foodPreferencesResult = await _dictRepository.getFoodPreferences();

    foodPreferencesResult.fold(Left.new, (r) {
      emit(state.copyWith(foodPreferences: r));
    });

    final idealMeetingPointsResult =
        await _dictRepository.getIdealMeetingPoints();
    idealMeetingPointsResult.fold(Left.new, (r) {
      emit(state.copyWith(idealMeetingPoints: r));
    });

    final languagesResult = await _dictRepository.getLanguages();

    languagesResult.fold(Left.new, (r) {
      emit(state.copyWith(languages: r));
    });

    final petsResult = await _dictRepository.getPets();

    petsResult.fold(Left.new, (r) {
      emit(state.copyWith(pets: r));
    });

    final professionalStatusesResult =
        await _dictRepository.getProfessionalStatuses();

    professionalStatusesResult.fold(Left.new, (r) {
      emit(state.copyWith(professionalStatuses: r));
    });

    final religionsResult = await _dictRepository.getReligions();

    religionsResult.fold(Left.new, (r) {
      emit(state.copyWith(religions: r));
    });

    final sleepHabitsResult = await _dictRepository.getSleepHabits();

    sleepHabitsResult.fold(Left.new, (r) {
      emit(state.copyWith(sleepHabits: r));
    });

    final smokeStatusesResult = await _dictRepository.getSmokeStatuses();

    smokeStatusesResult.fold(Left.new, (r) {
      emit(state.copyWith(smokeStatuses: r));
    });

    final spheresResult = await _dictRepository.getSpheres();

    spheresResult.fold(Left.new, (r) {
      emit(state.copyWith(spheres: r));
    });

    final workoutsResult = await _dictRepository.getWorkouts();

    workoutsResult.fold(Left.new, (r) {
      emit(state.copyWith(workouts: r));
    });

    final covidResult = await _dictRepository.getCovid();

    covidResult.fold(Left.new, (r) {
      emit(state.copyWith(covid: r));
    });

    emit(state.copyWith(status: StateStatus.fetchingSuccess));
  }

  Future<void> onPressedSaveHeight(int value) async {
    _setLoading();

    final result = await _repository.updateHeight(value);

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveEducation(int value) async {
    _setLoading();

    final result = await _repository.updateEducation(
      state.educations.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveProfessionalStatus(int value) async {
    _setLoading();

    final result = await _repository.updateProfessionalStatus(
      state.professionalStatuses.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveSphere(int value) async {
    _setLoading();

    final result = await _repository.updateSphere(
      state.spheres.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveReligion(int value) async {
    _setLoading();

    final result = await _repository.updateReligion(
      state.religions.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveFamilyPlan(int value) async {
    _setLoading();

    final result = await _repository.updateFamilyPlan(
      state.familyPlans.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveCovid(int value) async {
    _setLoading();

    final result = await _repository
        .updateCovid(state.covid.firstWhere((element) => element.id == value));

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveSmokeStatus(int value) async {
    _setLoading();

    final result = await _repository.updateSmokeStatus(
      state.smokeStatuses.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveAlcoholStatus(int value) async {
    _setLoading();

    final result = await _repository.updateAlcoholStatus(
      state.alcoholStatuses.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveWorkout(int value) async {
    _setLoading();

    final result = await _repository.updateWorkout(
      state.workouts.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveFoodPreference(int value) async {
    _setLoading();

    final result = await _repository.updateFoodPreference(
      state.foodPreferences.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveSleepHabit(int value) async {
    _setLoading();

    final result = await _repository.updateSleepHabit(
      state.sleepHabits.firstWhere((element) => element.id == value),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSavePets(List<int> value) async {
    _setLoading();

    final result = await _repository.updatePets(
      state.pets.where((element) => value.contains(element.id)).toList(),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  Future<void> onPressedSaveIdealMeeting(List<int> value) async {
    _setLoading();

    final result = await _repository.updateIdealMeetingPoints(
      state.idealMeetingPoints
          .where((element) => value.contains(element.id))
          .toList(),
    );

    result.fold(_setError, (r) => _setSuccess());
  }

  void _setLoading() {
    emit(state.copyWith(status: StateStatus.fetchingInProgress, error: null));
  }

  void _setError(Failure error) {
    _notifyService.showError(error.message ?? error.getLocalizedString());

    emit(state.copyWith(status: StateStatus.fetchingFailure));
  }

  void _setSuccess() {
    emit(state.copyWith(status: StateStatus.fetchingSuccess));
  }
}

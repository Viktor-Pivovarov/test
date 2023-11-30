import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

enum ProfileStatus {
  register,
  moderation,
  active,
  reModeration,
  rejected,
  deleted,
  frozen,
}

enum ZodiacEnum {
  capricorn, // (козерог)
  aquarius, // (водолей)
  pisces, // (рыбы)
  aries, // (овен)
  taurus, // (телец)
  gemini, // (близнецы)
  cancer, // (рак)
  leo, // (лев)
  virgo, // (дева)
  libra, // (весы)
  scorpio, // (скорпион)
  sagittarius, // (стрелец)
}

enum QuestionnaireEnum {
  height,
  education,
  professionalStatus,
  sphere,
  religion,
  familyPlan,
  covid,
  smokeStatus,
  alcoholStatus,
  foodPreference,
  workout,
  sleepHabit,
  pets,
  idealMeetingPoints,
}

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required ProfileStatus status,
    @Default(0) int filling,
    @Default('') String bio,
    ZodiacEnum? zodiac,
    String? firstName,
    DictModel? education,
    DictModel? sphere,
    DictModel? professionalStatus,
    DictModel? religion,
    DictModel? familyPlan,
    DictModel? smokeStatus,
    DictModel? alcoholStatus,
    DictModel? foodPreference,
    DictModel? workout,
    DictModel? sleepHabit,
    DictModel? covid,
    String? birthday,
    @Default(<PhotoModel>[]) List<PhotoModel> photos,
    @Default(<DictModel>[]) List<DictModel> languages,
    @Default(<DictModel>[]) List<DictModel> idealMeetingPoints,
    @Default(<DictModel>[]) List<DictModel> pets,
    @Default(<DictModel>[]) List<DictModel> interests,
    @Default(<DictModel>[]) List<DictModel> biometrics,
  }) = _ProfileModel;

  const ProfileModel._();

  factory ProfileModel.fromJson(Object? json) =>
      _$ProfileModelFromJson(json! as Map<String, dynamic>);

  @override
  Map<String, dynamic> toJson();

  String? get birthdayFormat {
    if (birthday == null) {
      return null;
    }

    return DateFormat.yMd().format(DateTime.parse(birthday!));
  }

  bool get onRegister => ProfileStatus.register == status;

  bool get isActive => ProfileStatus.active == status;

  bool get onModerate => ProfileStatus.moderation == status;

  bool get onReModerate => ProfileStatus.reModeration == status;

  bool get isModeration => onModerate || onReModerate;

  bool get isRejected => ProfileStatus.rejected == status;

  bool get isFreezed => ProfileStatus.frozen == status;

  bool get isRegistered => onModerate || onReModerate || isActive || isFreezed;

  bool get isFillingCompleted => filling == 100;

  String? get petsValue {
    if (pets.isEmpty) {
      return null;
    }

    return pets.map((e) => e.name).join(', ');
  }

  String? get idealMeetingPointsValue {
    if (idealMeetingPoints.isEmpty) {
      return null;
    }

    return idealMeetingPoints.map((e) => e.name).join(', ');
  }

  String get formattedBio {
    if (bio.length > 500) {
      return bio.substring(0, 500);
    }

    return bio;
  }
}

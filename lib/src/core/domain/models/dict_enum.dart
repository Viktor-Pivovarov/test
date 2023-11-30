enum DictEnum {
  alcohol,
  educations,
  familyPlans,
  foodPreferences,
  idealMeetingPoints,
  languages,
  pets,
  professional,
  religions,
  sleepHabits,
  smokeStatuses,
  spheres,
  covid,
  complainReasons,
  workouts;

  static DictEnum fromString(String value) {
    switch (value) {
      case 'alcohol':
        return alcohol;
      case 'educations':
        return educations;
      case 'familyPlans':
        return familyPlans;
      case 'foodPreferences':
        return foodPreferences;
      case 'idealMeetingPoints':
        return idealMeetingPoints;
      case 'languages':
        return languages;
      case 'pets':
        return pets;
      case 'professional':
        return professional;
      case 'religions':
        return religions;
      case 'sleepHabits':
        return sleepHabits;
      case 'smokeStatuses':
        return smokeStatuses;
      case 'spheres':
        return spheres;
      case 'workouts':
        return workouts;
      case 'covid':
        return covid;
      case 'complainReasons':
        return complainReasons;
    }

    throw Error();
  }
}

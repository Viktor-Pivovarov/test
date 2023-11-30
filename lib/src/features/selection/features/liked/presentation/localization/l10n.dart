import 'package:intl/intl.dart';
import 'package:jojo/src/features/selection/_selection.dart';

class LikedI18n {
  static String get title => Intl.message(
        'Liked you',
        desc: 'Description for Liked title',
        name: 'LikedI18n_title',
      );

  static String get likedNotFound => Intl.message(
        'Liked not found',
        desc: 'Description for Liked not found',
        name: 'LikedI18n_likedNotFound',
      );

  static String get noLikes => Intl.message(
        'У тебя пока нет\nсимпатий',
        desc: 'Заголовок при отсутствии симпатий',
        name: 'LikedI18n_noLikes',
      );

  static String noLikesHint(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true: 'Здесь будут анкеты мужчин, которые\nпоставили тебе лайк',
          false: 'Здесь будут анкеты девушек, которые\nпоставили тебе лайк',
        },
        desc: 'Подсказка при отсутствии симпатий',
        name: 'LikedI18n_noLikesHint',
        args: [choice],
      );

  static String shownSympathy(Object choice) => Intl.select(
        choice,
        <Object, String>{
          true:
              'Эти мужчины проявили симпатию к тебе.\nОни могут не соответствовать параметрам\nтвоего подбора',
          false:
              'Эти девушки проявили симпатию к тебе.\nОни могут не соответствовать параметрам\nтвоего подбора',
        },
        desc: 'Подсказка девушки/мужчине о том, что к ним проявлена симпатия',
        name: 'LikedI18n_shownSympathy',
        args: [choice],
      );

  static String likedSortTypeTitle(Sort value) => Intl.select(
        value,
        {
          Sort.createdAt: 'По дате',
          Sort.compatibility: 'По совместимости',
          Sort.age: 'По возрасту',
        },
        name: 'LikedI18n_likedSortTypeTitle',
        args: [value],
      );

  static String get photoBadge => Intl.message(
        'NEW',
        desc: 'Подсказка на фотографии о том, что пользователь новый',
        name: 'LikedI18n_photoBadge',
      );
}

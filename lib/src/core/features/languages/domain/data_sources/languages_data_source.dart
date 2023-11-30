import 'package:jojo/src/core/features/languages/_languages.dart';

// ignore: one_member_abstracts
abstract class LanguagesDataSource {
  Future<LanguagesModel> getLanguages();
}

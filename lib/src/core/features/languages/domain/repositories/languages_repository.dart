import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class LanguagesRepository {
  Future<Either<Failure, LanguagesModel>> getLanguages();
}

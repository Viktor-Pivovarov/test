import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class SupportingRepository {
  Future<Either<Failure, void>> create({required SupportingModel model});
}

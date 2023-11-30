import 'package:jojo_supporting/jojo_supporting.dart';

// ignore: one_member_abstracts
abstract class SupportingDataSource {
  Future<void> create(SupportingModel model);
}

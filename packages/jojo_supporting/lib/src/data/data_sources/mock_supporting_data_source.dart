import 'package:jojo_supporting/jojo_supporting.dart';

class MockSupportingDataSource implements SupportingDataSource {
  @override
  Future<void> create(SupportingModel model) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    return;
  }
}

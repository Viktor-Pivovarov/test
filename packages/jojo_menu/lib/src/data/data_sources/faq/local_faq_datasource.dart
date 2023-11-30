import 'package:jojo_menu/jojo_menu.dart';

abstract class LocalFaqDataSource {
  Future<void> init();

  Future<void> clear();

  Stream<FaqModel> watch();

  Future<FaqModel> getFaq();

  Future<void> saveFaq(FaqModel faq);
}

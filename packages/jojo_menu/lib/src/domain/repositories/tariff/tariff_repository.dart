// ignore_for_file: one_member_abstracts

import 'package:jojo_menu/src/_menu.dart';
import 'package:xander9112/xander9112.dart';

abstract class TariffRepository {
  Future<Either<Failure, List<TariffModel>>> getTariffs();
}

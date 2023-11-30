import 'package:auto_route/auto_route.dart';
import 'package:jojo_sdk/src/use_case/no_params.dart';
import 'package:jojo_sdk/src/use_case/use_case.dart';

class PopCase implements UseCase<void, NoParams> {
  PopCase(this._router);

  final RootStackRouter _router;

  @override
  Future<void> call(NoParams noParams) async {
    await _router.pop();
  }
}

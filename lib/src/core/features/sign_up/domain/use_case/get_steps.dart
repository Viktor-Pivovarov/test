import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetStepsCase
    implements UseCase<Either<Failure, WorksheetStepsResponseModel>, NoParams> {
  GetStepsCase(this._signUpRepository);

  final SignUpRepository _signUpRepository;

  @override
  Future<Either<Failure, WorksheetStepsResponseModel>> call(
    NoParams onResult,
  ) async {
    return _signUpRepository.getWorksheetSteps();
  }
}

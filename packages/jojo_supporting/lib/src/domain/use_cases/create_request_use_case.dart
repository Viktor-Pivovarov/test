import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

class CreateRequestUseCase
    extends UseCase<Either<Failure, void>, SupportingModel> {
  CreateRequestUseCase(this.supportingRepository);

  final SupportingRepository supportingRepository;

  @override
  Future<Either<Failure, void>> call(
    SupportingModel params,
  ) async {
    return supportingRepository.create(model: params);
  }
}

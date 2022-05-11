import 'package:stadium_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:stadium_app/core/usecase/usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/repositories/auth_repository.dart';

class GetCurrentUIDUseCase implements UseCase<String?, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUIDUseCase(this.authRepository);

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await authRepository.getCurrentUId();
  }
}

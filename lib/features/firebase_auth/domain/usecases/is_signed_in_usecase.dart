import 'package:stadium_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:stadium_app/core/usecase/usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/repositories/auth_repository.dart';

class IsSignedInUseCase implements UseCase<bool?, NoParams> {
  final AuthRepository authRepository;

  IsSignedInUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await authRepository.isSignIn();
  }
}

import 'package:stadium_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:stadium_app/core/usecase/usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/features/firebase_auth/domain/repositories/auth_repository.dart';

class GetCreateCurrentUserUseCase implements UseCase<void, UserEntity> {
  final AuthRepository authRepository;

  GetCreateCurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(UserEntity user) async {
    return await authRepository.getCreateCurrentUser(user);
  }
}

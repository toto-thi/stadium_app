// import 'package:stadium_app/features/firebase_auth/data/datasources/auth_local_datasource.dart';
import 'package:stadium_app/features/firebase_auth/data/datasources/auth_remote_datasource.dart';
import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:stadium_app/features/firebase_auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthenticationRemoteDataSource authRemoteDataSource;
  // final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    //  required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, String?>> getCurrentUId() async {
    var result = await authRemoteDataSource.getCurrentUId();
    return Right(result ?? "");
  }

  @override
  Future<Either<Failure, void>> getCreateCurrentUser(UserEntity user) async {
    var result = await authRemoteDataSource.getCreateCurrentUser(user);
    return Right(result);
  }

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    var result = await authRemoteDataSource.isSignIn();
    return Right(result);
  }

  @override
  Future<Either<Failure, void>> signIn(UserEntity user) async {
    var result = await authRemoteDataSource.signIn(user);
    return Right(result);
  }

  @override
  Future<Either<Failure, void>> signUp(UserEntity user) async {
    var result = await authRemoteDataSource.signUp(user);
    return Right(result);
  }

  @override
  Future<Either<Failure, void>> singOut() async {
    return Right(await authRemoteDataSource.singOut());
  }

  @override
  Future<Either<Failure, UserModel?>> getUserDetailById(String uid) async {
    var result = await authRemoteDataSource.getUserDetail(uid);
    return Right(result);
  }
}

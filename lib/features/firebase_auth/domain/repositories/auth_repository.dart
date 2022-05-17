
import 'package:dartz/dartz.dart';
import 'package:stadium_app/core/error/failures.dart';
import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> isSignIn();  
  Future<Either<Failure, void>> signIn(UserEntity user); 
  Future<Either<Failure, void>> signUp(UserEntity user); 
  Future<Either<Failure, void>> singOut(); 
  Future<Either<Failure, String?>> getCurrentUId(); 
  Future<Either<Failure, void>> getCreateCurrentUser(UserEntity user); 
  Future<Either<Failure, UserModel?>> getUserDetailById(String uid);
  // Future<Either<Failure, UserEntity?>> getFullUserData()
}
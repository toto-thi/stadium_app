// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';

// abstract class AuthenticationLocalDataSource {
//   Future<bool> cacheIsSignIn();
//   Future<void> cacheSignIn(UserEntity userEntity);
//   Future<String> cacheGetCurrentUId();
//   Future<void> cacheGetCurrentUser(UserEntity userEntity);
// }

// const CACHED_USER_ID = 'CACHED_USER_ID';
// const CACHED_CURRENT_USER = 'CACHED_CURRENT_USER';
// const CACHED_SIGNIN = 'CACHED_SIGNIN';
// const CACHED_ISSIGNIN = 'CACHED_ISSIGNIN';

// class AuthenticationLocalDataSourceImpl implements AuthenticationLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   AuthenticationLocalDataSourceImpl({required this.sharedPreferences});

//   @override
//   Future<String> cacheGetCurrentUId() {
//     // TODO: implement cacheGetCurrentUId
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> cacheGetCurrentUser(UserEntity userEntity) {
//     // TODO: implement cacheGetCurrentUser
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> cacheIsSignIn() {
//     // TODO: implement cacheIsSignIn
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> cacheSignIn(UserEntity userEntity) {
//     // TODO: implement cacheSignIn
//     throw UnimplementedError();
//   }


// }
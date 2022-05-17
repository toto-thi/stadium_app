// //get user data and store here

// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:stadium_app/core/error/exceptions.dart';
// import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';

// abstract class AuthLocalDataSource {
//   Future<UserModel> getUserInfo();
// }

// const CACHED_USER_DATA = 'CACHE_USER_DATA';

// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   AuthLocalDataSourceImpl({required this.sharedPreferences});

//   @override
//   Future<UserModel> getUserInfo() async {
//     final jsonString = sharedPreferences.getString(CACHED_USER_DATA);

//     if (jsonString != null) {
//       return Future.value(UserModel.fromSnapshot(json.decode(jsonString)));
//     } else {
//       throw CacheException();
//     }
//   }
// }

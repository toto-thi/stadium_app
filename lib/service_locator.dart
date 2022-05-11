import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadium_app/features/firebase_auth/data/datasources/auth_remote_datasource.dart';
import 'package:stadium_app/features/firebase_auth/data/repositories/auth_repository_impl.dart';
import 'package:stadium_app/features/firebase_auth/domain/repositories/auth_repository.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/get_current_user_usecase.dart.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sign_up_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sing_in_usecase.dart.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sing_out_usecase.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/user/user_cubit.dart';

import 'core/network/network_info.dart';

final sl = GetIt.I;

Future<void> init() async {
//login/register
  //data source
  sl.registerFactory<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      auth: sl(),
      firestore: sl(),
    ),
  );
  //repository
  sl.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  //useCase
  sl.registerLazySingleton(() => GetCreateCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUIDUseCase(sl()));
  sl.registerLazySingleton(() => IsSignedInUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  //cubit
  sl.registerFactory(() => AuthCubit(
      getCurrentUIDUseCase: sl(),
      isSignedInUseCase: sl(),
      signOutUseCase: sl()));
  sl.registerFactory(() => UserCubit(
      getCreateCurrentUserUseCase: sl(),
      signInUseCase: sl(),
      signUpUseCase: sl()));

//homepage

//search?

//booking

//settings

  //core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  //external
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}

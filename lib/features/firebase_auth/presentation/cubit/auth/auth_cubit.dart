import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stadium_app/core/error/exceptions.dart';
import 'package:stadium_app/core/error/failures.dart';
import 'package:stadium_app/core/usecase/usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/get_current_uid_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sing_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUIDUseCase getCurrentUIDUseCase;
  final IsSignedInUseCase isSignedInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    required this.getCurrentUIDUseCase,
    required this.isSignedInUseCase,
    required this.signOutUseCase,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignedInUseCase.call(NoParams());
      final uid = await getCurrentUIDUseCase.call(NoParams());

      isSignIn.fold((failure) => emit(ErrorState(failure)), (success) {
        success = true;

        if (success) {
          uid.fold(
            (failure) => emit(ErrorState(failure)),
            (uid) {
              emit(Authenticated(uid: uid!));
            },
          );
        }
      });
    } on ServerException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUIDUseCase.call(NoParams());

      uid.fold(
        (failure) => emit(ErrorState(failure)),
        (uid) {
          emit(Authenticated(uid: uid!));
        },
      );
    } on ServerException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      final loggedOut = await signOutUseCase.call(NoParams());
      loggedOut.fold((failure) => emit(ErrorState(failure)),
          (r) => emit(UnAuthenticated()));
    } on ServerException catch (_) {
      emit(UnAuthenticated());
    }
  }
}

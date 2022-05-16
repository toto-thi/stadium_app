import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stadium_app/core/error/exceptions.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/get_current_user_usecase.dart.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sign_up_usecase.dart';
import 'package:stadium_app/features/firebase_auth/domain/usecases/sing_in_usecase.dart.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  UserCubit(
      {required this.getCreateCurrentUserUseCase,
      required this.signInUseCase,
      required this.signUpUseCase})
      : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());

    try {
      final r = await signInUseCase.call(user);

      r.fold(
        (l) => emit(UserFailure()),
        (r) => emit(UserSuccess()),
      );
    } on ServerException catch (_) {
      emit(UserFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());

    try {
      final result = await signUpUseCase.call(user);
      final createUser = await getCreateCurrentUserUseCase.call(user);

      result.fold(
        (l) => emit(UserFailure()),
        (res) => {
          createUser.fold((l) => emit(UserFailure()), (res) {
            emit(UserSuccess());
          }),
          emit(UserSuccess()),
        },
      );
    } on ServerException catch (_) {
      emit(UserFailure());
    }
  }
}

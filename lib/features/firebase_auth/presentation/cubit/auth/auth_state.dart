part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String uid;

  const Authenticated({required this.uid});

  @override
  List<Object> get props => [uid];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final Failure failure;

  const ErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uid;  //user model

  AuthSuccess({required this.uid});
}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

final class AuthLoading extends AuthState{}
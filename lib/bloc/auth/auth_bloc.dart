import 'package:bloc/bloc.dart';
import 'package:bloc_counter/bloc/auth/auth_events.dart';
import 'package:bloc_counter/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);

    on<LogoutButtonPressed>(_onLogoutButtonPressed);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      // Define regex pattern for email validation
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

      // Validate email
      if (!emailRegex.hasMatch(email)) {
        return emit(AuthFailure(error: 'Invalid email address'));
      }

      // Validate password length
      if (password.length < 6) {
        return emit(
            AuthFailure(error: 'Password cannot be less than 6 characters'));
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email\n$password'));
      });
    } catch (e) {
      return emit(AuthFailure(error: e.toString()));
    }
  }

  void _onLogoutButtonPressed(
      LogoutButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}

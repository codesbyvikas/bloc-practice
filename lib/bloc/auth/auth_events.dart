import 'package:flutter/material.dart';

@immutable
sealed class AuthEvents {}

final class LoginButtonPressed extends AuthEvents {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

final class LogoutButtonPressed extends AuthEvents{
  
}
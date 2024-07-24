import 'package:bloc_counter/bloc/auth/auth_bloc.dart';
import 'package:bloc_counter/bloc/auth/auth_events.dart';
import 'package:bloc_counter/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Appbar will also rebuild to avoid unnecessary rebuild use BlocBuilder
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(children: [
            Center(
              child: Text((state as AuthSuccess).uid),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutButtonPressed());
              },
              child: const Text("Logout"),
            ),
          ]);
        },
      ),
    );
  }
}

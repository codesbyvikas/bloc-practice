import 'package:bloc_counter/screens/auth_screen/login_screen.dart';
import 'package:bloc_counter/screens/counter_screen/counter_page.dart'; // Ensure this path is correct
import 'package:bloc_counter/screens/todo_screen/todo_list.dart';
import 'package:bloc_counter/screens/weather/weather_screen.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "Counter"),
                  ),
                );
              },
              child: const Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TodoList()));
              },
              child: const Text("ToDo"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text("Login Screen"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WeatherScreen()));
                },
                child: const Text("Weather Screen"))
          ],
        ),
      ),
    );
  }
}

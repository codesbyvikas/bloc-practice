import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});
  final TextEditingController _todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(" Add Todo"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _todo,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Add"))
        ],
      ),
    );
  }
}

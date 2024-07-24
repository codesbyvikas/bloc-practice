import 'package:flutter/material.dart';

class Monkey extends StatefulWidget {
  const Monkey({super.key});

  @override
  State<Monkey> createState() => _MonkeyState();
}

class _MonkeyState extends State<Monkey> {
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  bool _showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Animal",
                hintText: "Enter the name of the Animal",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              autofillHints: [AutofillHints.name],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                  _showImage = false;
                });

                await Future.delayed(const Duration(seconds: 2));

                setState(() {
                  _isLoading = false;
                  _showImage = true;
                });
              },
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Submit"),
            ),
            const SizedBox(height: 16),
            if (_showImage)
              _nameController.text.trim() != "vikas"
                  ? Column(
                      children: [
                        Text(
                          "Animal Found with name ${_nameController.text.trim()}",
                          style: const TextStyle(fontSize: 25),
                        ),
                        Image.asset(
                          'images/monkey.jpg', // Make sure to add this image to your assets
                          height: 200,
                        ),
                      ],
                    )
                  : const Text("There is no animal with this name"),
          ],
        ),
      ),
    );
  }
}

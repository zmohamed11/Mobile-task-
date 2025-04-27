import 'package:flutter/material.dart';
import 'main.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    body.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('First Screen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.jpg"),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                minLines: 2,
                maxLines: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: body,
                minLines: 5,
                maxLines: 7,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Body",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                title: title.text,
                body: body.text,
              ),
            ),
          );
        },
      ),
    );
  }
}

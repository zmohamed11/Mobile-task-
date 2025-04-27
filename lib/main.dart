import 'package:flutter/material.dart';
import 'home_page.dart';
import 'first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final String body;
  const MyHomePage({required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("The $title")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/Tree.jpg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                const Fav(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(body, textAlign: TextAlign.justify),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MySeason(url: "assets/TreeFall.jpg", text: "Fall"),
                MySeason(url: "assets/TreeSpring.jpg", text: "Spring"),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}

class MySeason extends StatelessWidget {
  final String url, text;
  const MySeason({required this.url, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(height: 100, width: 100, fit: BoxFit.cover, url),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 30)),
      ],
    );
  }
}

class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Icon(Icons.favorite, color: isFav ? Colors.red : Colors.grey),
    );
  }
}

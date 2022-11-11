import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: FeedScreen(),
    );
  }
}

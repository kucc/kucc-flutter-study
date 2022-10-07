import 'package:flutter/material.dart';
import 'package:kucc_flutter/views/show_dialog_screen.dart';
import 'package:kucc_flutter/views/test_screen.dart';
import 'package:kucc_flutter/views/welcome.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      home: const ShowDialogScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kucc_flutter/services/permission_service.dart';
import 'package:kucc_flutter/views/show_dialog_screen.dart';

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
      home: Builder(
        builder: (context) {
          // PermissionService.getPermission();
          return const ShowDialogScreen();
        }
      ),
    );
  }
}
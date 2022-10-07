import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Profile(),
            Profile(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomTab(),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.account_circle,
          size: 40,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '홍길동',
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}

class BottomTab extends StatelessWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.chat),
            Icon(Icons.contact_page),
          ],
        ),
      ),
    );
  }
}

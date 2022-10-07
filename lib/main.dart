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
      appBar: AppBar(title: Text('2번째 과제')),
      bottomNavigationBar: BottomNavBarWidget(),
      body: ListViewWidget(),
    ));
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(children: const [Icon(Icons.person), Text('홍길동')]),
        Row(children: const [Icon(Icons.person), Text('홍길동')]),
        Row(children: const [Icon(Icons.person), Text('홍길동')]),
      ],
    );
  }
}

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: '전화'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: '메시지'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: '추가'),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}

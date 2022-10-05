import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class bottom extends StatelessWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
    child: Container(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(Icons.phone),
      Icon(Icons.chat),
      Icon(Icons.contact_page),],
    ),
    ),
    );
  }
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
              ListTile(
                leading: Icon(Icons.account_circle, size: 50,),
                title: Text('홍길동', style: TextStyle(fontSize: 20,),),),
              ListTile(
                leading: Icon(Icons.account_circle, size: 50,),
                title: Text('홍길동', style: TextStyle(fontSize: 20,),),),
              ListTile(
                leading: Icon(Icons.account_circle, size: 50,),
                title: Text('홍길동', style: TextStyle(fontSize: 20,),),),]
                ,
              ),
        bottomNavigationBar: bottom(),
          ),
        );
  }
}



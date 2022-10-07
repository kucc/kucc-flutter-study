import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(like[index].toString()),
              title: Text(
                name[index],
              ),
              trailing: ElevatedButton(
                child: Text('좋아요'),
                onPressed: () {
                  print(like[index]);
                  setState(() {
                    like[index]++;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

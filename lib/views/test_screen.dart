import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 3, child: SizedBox(height: double.infinity,),),
          Flexible(flex: 3,child: Container(color: Colors.red, width: 100, height: 100,),),
          Flexible(flex: 1,child: Container(color: Colors.green, width: 100, height: 100),)
        ],
      ),
    );
  }
}

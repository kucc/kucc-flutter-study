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
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => {},
                    color: Colors.black),
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => {},
                    color: Colors.black),
                IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () => {},
                    color: Colors.black)
              ],
              title: Row(
                children: [
                  Text('금호동 3가', style: TextStyle(color: Colors.black)),
                  // Icon(Icons.arrow_drop_down, color: Colors.black),
                  IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {},
                      color: Colors.black),
                ],
              ),
              backgroundColor: Colors.white,
              // actions: [],
            ),
            body: Container(
                height: 150,
                padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Image.asset('assets/camera.jpeg', width: 150)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('고양시 덕양구 화정동 10분 전',
                              style: TextStyle(color: Colors.grey)),
                          Text('210,000원',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.favorite_outline),
                              Text('4')
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}

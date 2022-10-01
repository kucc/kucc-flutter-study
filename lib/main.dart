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
            leading: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '금호동 3가',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            leadingWidth: 200,
            actions: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
            ],
            backgroundColor: Colors.white),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              width: 150,
              height: 150,
              'assets/image.jpeg',
            ),
            Container(
              width: 220,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                  Text(
                    '성동구 행당동 · 끌올 10분 전',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 128, 128, 128),
                      height: 1.4,
                    ),
                  ),
                  Text(
                    '210,000원',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton.icon(
                      label: Text('4'),
                      icon: Icon(
                        Icons.heart_broken,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

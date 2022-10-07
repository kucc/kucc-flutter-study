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
  var a = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            a++;
          });
        },
        child: Text(a.toString()),
      ),
      appBar: AppBar(title: Text('3번째 과제')),
      bottomNavigationBar: BottomNavBarWidget(),
      body: ListViewWidget(),
    ));
  }
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  var name = ['김영숙', '홍길동', '피자집'];
  var number = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (c, i) {
        return Container(
          padding: EdgeInsets.all(10),
          width: 300,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text(number[i].toString()),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(name[i]),
                ),
              ],
            ),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    number[i]++;
                  });
                })
          ]),
        );
      },
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

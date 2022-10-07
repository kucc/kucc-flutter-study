import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  ),
  );
}

class bottom extends StatelessWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
    child: Container(
      height: 60,
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

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['김영숙','홍길동','피자집'];
  var like = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Text('안녕'),
            onPressed: (){
              showDialog(context: context, builder: (context){
                return Dialog(child:
                Container(
                  padding: EdgeInsets.all(40),
                  width: 400,
                  height:300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contact', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,),),
                      TextField(decoration: InputDecoration(hintText: 'Enter your phone number'),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: Text('Cancel'),),
                          TextButton(onPressed: (){}, child: Text('OK'),),],
                      )
                    ],
                  ),
                )
                );
              });
            },
          ),
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (c,i){
              return ListTile(
                leading: Container(
                  child:
                  Text(like[i].toString()),
                ),
                title: Text(name[i], style: TextStyle(fontSize: 20,),
                ),
                trailing: TextButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),),
                  child: Text('좋아요', style: TextStyle(color: Colors.white,)),
                  onPressed: (){
                    setState(() {
                      like[i]++;
                    });
                  },
                ),
              );
            }, ),
        bottomNavigationBar: bottom(),
          );
  }
}



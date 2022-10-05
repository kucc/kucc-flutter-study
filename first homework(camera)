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
       appBar: AppBar(backgroundColor: Colors.white,
         leadingWidth: 150,
         leading: Container(
           child: Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.expand_more, color: Colors.black,),
              Text('금호동3가', style: TextStyle(color: Colors.black,
               fontWeight: FontWeight.w800,
               fontSize: 20
           ),
           ),
             ]
         ),
         ),
           actions: [
             Icon(Icons.search, color: Colors.black, size: 40,),
             Icon(Icons.reorder, color: Colors.black, size: 40,),
             Icon(Icons.expand_more, color: Colors.black, size: 40,),
           ],
       ),
       body: Container(
         height: 160,
         padding: EdgeInsets.all(20),
         child: Row(
               children: [Image.asset('camera.jpg', width: 150,),
               Container(
                 width: 300,
                 padding: EdgeInsets.only(left: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                   Text('캐논 DSLR 100D (단렌즈,', style: TextStyle(fontSize: 17),),
                   Text('충전기 16기가SD 포함)', style: TextStyle(fontSize: 17),),
                   Text('성동구 행당동 끌올 10분전', style: TextStyle(fontSize: 10, color: Colors.grey),),
                   Text('210,000원', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Icon(Icons.favorite_border),
                           Text('4'),
                         ]
                       )
                 ],
               ),
               ),
               ],
         ),
         ),
       bottomNavigationBar: BottomAppBar(),
       ),
     );
  }
}


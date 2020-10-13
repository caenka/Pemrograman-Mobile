import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //method runApp untuk menjalankan class MyApp
}

class MyApp extends StatelessWidget { //membuat class MyApp yang merupakan turunan dari StatelessWidget
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tanda debug
      home: MyHomePage(title: 'WeCare - 2'), // untuk menamai judul
    );
  }
}

class MyHomePage extends StatefulWidget { //membuat class MyHomePage yang merupakan turunan dari StateFulWidget
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return Scaffold( //mengembalikan scaffold
      appBar: AppBar( //untuk tampilan appbar
        title: Text(widget.title),
      ),
      body: Container( //untuk tampilan body
        child: Column(
          children : [ //untuk menampilkan daftar text
            Text ('Caesarina Kurnia Ananta - 182410102008'), //untuk membuat text
            Text ('Zihan Muhammad Al Ghifari Ibnu Zain - 182410102036'), //untuk membuat text
            Text ('Calvin Catur Alfarizi - 182410102061'),//untuk membuat text
          ]
        )
      )
    );
  }
}

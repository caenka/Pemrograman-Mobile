import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/login_page.dart';

// ROUTES DEPEDENCY
import 'package:project/routes/Routes.dart';


void main() {
  runApp(MyApp()); //method runApp untuk menjalankan class MyApp
}

class MyApp extends StatelessWidget { //membuat class MyApp yang merupakan turunan dari StatelessWidget
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : 'Wecare',
      initialRoute: '/users',
      routes: routes,
    );
  }
}
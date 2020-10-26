import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); //method runApp untuk menjalankan class MyApp
}

class MyApp extends StatelessWidget { //membuat class MyApp yang merupakan turunan dari StatelessWidget
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tanda debug
      home: MyHomePage(title: 'WeCare - 2'),
      // untuk menamai judul
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
        resizeToAvoidBottomPadding: false,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'WE',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                    child: Text(
                      'CARE',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(195.0, 168.0, 0.0, 0.0),
                    child: Text(
                      '2',
                      style: TextStyle(
                          fontSize: 90.0, fontWeight: FontWeight.bold,color: Colors.red),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:350.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)
                              )
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0),
                          padding: EdgeInsets.only(top: 20.0, left: 20.0),
                          child: InkWell(
                              child: Text('Forget Password',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline)
                              )
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text('Login', style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            Text('Belum punya akun?',
                              style: TextStyle(fontFamily: 'Montserrat'),),
                            SizedBox(width: 10.0),
                            InkWell(
                              onTap: () {},
                              child: Text('Daftar',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}

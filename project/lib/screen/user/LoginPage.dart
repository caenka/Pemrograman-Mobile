import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/screen/user/RegristrasiPage.dart';
import 'package:project/screen/user/UserIndex.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(hex_white),
        body: MyContainer(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Container(
                  margin: EdgeInsets.only(bottom: 25, top: 10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 230,
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: HexColor(hex_darkorange)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: HexColor(hex_dark)))),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: HexColor(hex_darkorange)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: HexColor(hex_dark)))),
                        obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0),
                        padding: EdgeInsets.only(top: 20.0, left: 20.0),
                        child: InkWell(
                            child: Text('Lupa Password ?',
                                style: TextStyle(
                                    color: HexColor(hex_orange),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline))),
                      ),
                      SizedBox(height: 35.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: HexColor(hex_orange),
                          color: HexColor(hex_darkorange),
                          elevation: 7.0,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => UserIndex()));
                              },
                              child: Center(
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                      color: HexColor(hex_light),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Belum punya akun?',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => RegristrasiPage()));
                            },
                            child: Text('Daftar',
                                style: TextStyle(
                                    color: HexColor(hex_red),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

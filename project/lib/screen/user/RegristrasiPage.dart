import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';

class RegristrasiPage extends StatefulWidget {
  @override
  _RegristrasiPageState createState() => _RegristrasiPageState();
}

class _RegristrasiPageState extends State<RegristrasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(hex_white),
      body: MyContainer(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:5.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),

                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'No Telepon',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),

                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Alamat',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),

                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Konfirmasi Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: HexColor(hex_darkorange)
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(hex_dark))
                          )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 35.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: HexColor(hex_orange),
                        color: HexColor(hex_darkorange),
                        elevation: 7.0,
                        child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text('Registrasi', style: TextStyle(
                                  color: HexColor(hex_light),
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
                        Text('Sudah punya akun?',
                          style: TextStyle(fontFamily: 'Montserrat'),),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text('Masuk',
                              style: TextStyle(
                                  color: HexColor(hex_red),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline)
                          ),
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

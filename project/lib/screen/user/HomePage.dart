import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/MyHeader.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Asset
import 'package:project/presentation/custom_icon_icons.dart';

class HomePage extends StatelessWidget{
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
                width: 120,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: MyHeader.Title('Yuk Berbagi Bersama Wecare'),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: MyHeader.Subtitle('Bingung ? coba pilih dulu'),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 120,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        width: 80,
                        height: 80,
                        child: FlatButton(
                          onPressed: (){},
                          color: HexColor(hex_orange),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.markunread_mailbox,
                            size: 35,
                            color: HexColor(hex_white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Uang Ke Barang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HexColor(hex_dark)
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Donasi Kan Uang Menjadi Barang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: HexColor(hex_gray)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 120,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        width: 80,
                        height: 80,
                        child: OutlineButton(
                          onPressed: (){},
                          shape: CircleBorder(),
                          borderSide: BorderSide(
                            color: HexColor(hex_orange)
                          ),
                          child: Container(
                            child: Icon(
                              Icons.attach_money,
                              size: 35,
                              color: HexColor(hex_orange),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Uang Ke Uang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: HexColor(hex_dark)
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Donasi Kirim Uang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: HexColor(hex_gray)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 3.0),
              width: 240,
              child: Image.asset('assets/images/Gb.png'),
            ),
          ],
        ),
      ),
      
    );
  }
}
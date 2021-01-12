import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/MyHeader.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';

class DonePage extends StatefulWidget {
    @override
    _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: HexColor(hex_orange),
                title: Text('Wecare'),
                automaticallyImplyLeading: false,
            ),
            body: MyContainer(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                        children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: MyHeader.Title('Terimakasih Atas Donasinya !', fontSize: 18)
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 16),
                                child: MyHeader.Subtitle(
                                    'Tim Wecare akan segera Memproses, Semoga apa yang kamu lakukan menjadi berkah di kemudian Hari',
                                    textAlign: TextAlign.center
                                ),
                            ),
                            Image(
                                width: double.infinity,
                                image: AssetImage('assets/images/donation-done.png'),
                            ),
                            FractionallySizedBox(
                                widthFactor: 1,
                                child: RaisedButton(
                                    onPressed: (){
                                        Navigator.pushNamed(context, '/users');
                                    },
                                    color: HexColor(hex_orange),
                                    elevation: 0,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text(
                                        'Halaman Utama',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor(hex_white)
                                        ),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
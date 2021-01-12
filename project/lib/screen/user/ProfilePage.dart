import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/MyHeader.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyTextField.dart';
import 'package:project/components/MyHeader.dart';


class ProfilePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: HexColor(hex_white),
            body: MyContainer(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                            Container(
                                width: 162,
                                height: 162,
                                margin: EdgeInsets.only(bottom: 16),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle
                                ),
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/user.png')
                                ),
                            ),
                            SizedBox(
                                height: 10,
                            ),
                            MyHeader.Title(
                                'Cae',
                                fontSize: 32
                            ),
                            SizedBox(
                                height: 10,
                            ),
                            MyHeader.Subtitle(
                                'cae@gmail.com',
                                fontSize: 24
                            ),
                            SizedBox(
                                height: 40,
                            ),
                            OutlineButton(
                                onPressed: (){
                                    Navigator.pushNamed(context, '/login');
                                },
                                focusColor: HexColor(hex_danger),
                                highlightedBorderColor: HexColor(hex_danger),
                                borderSide: BorderSide(
                                    color: HexColor(hex_danger),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(hex_danger)
                                    ),
                                    ),
                                ),
                            ),
                        ]
                    ),
                )
            )
        );
    }
}
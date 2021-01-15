import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/api.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Model
import 'package:project/model/User.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyHeader.dart';

class ProfilePage extends StatelessWidget {
    User user = null;

    ProfilePage() {
        getUser();
    }

    void getUser() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        user = User.fromJson( json.decode(localStorage.get('user')) );
    }

    void logout() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var res = await Network().authPostData(null, '/logout');
        var body = json.decode(res.body);
        print(body);
        localStorage.remove('token');
    }

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
                                user != null ? user.name : 'No User',
                                fontSize: 32
                            ),
                            SizedBox(
                                height: 10,
                            ),
                            MyHeader.Subtitle(
                                user != null ? user.email : 'No User',
                                fontSize: 24
                            ),
                            SizedBox(
                                height: 40,
                            ),
                            OutlineButton(
                                onPressed: (){
                                    logout();
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
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyTextField.dart';
import 'package:project/components/MyHeader.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final _formKey = GlobalKey<FormState>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    bool _isLoading = false;
    
    var email;
    var password;
    String err = '';

    @override
    Widget build(BuildContext context) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        return GestureDetector(
            onTap: () {
                if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                }
            },
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: HexColor(hex_white),
                body: Stack(
                clipBehavior: Clip.antiAlias,
                    children: [
                        Positioned(
                            right: -30,
                            top: -30,
                            child: Opacity(
                                opacity: .2,
                                child: Container(
                                width: 140,
                                height: 140,
                                color: HexColor(hex_orange),
                                ),
                            ),
                        ),
                        Positioned(
                            left: -30,
                            bottom: -30,
                            child: Opacity(
                                opacity: .2,
                                child: Container(
                                    width: 140,
                                    height: 140,
                                    color: HexColor(hex_orange),
                                ),
                            ),
                        ),
                        MyContainer(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget> [
                                Container(
                                    margin: EdgeInsets.only(bottom: 25, top: 10),
                                    child: Image.asset(
                                    'assets/images/logo.png',
                                    width: 100,
                                    ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: MyHeader.Title('Selamat Datang Kembali', fontSize: 18)
                                ),
                                Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: MyHeader.Subtitle('Siap melakukan hal luar biasa hari ini'),
                                ),
                                // FORM 
                                Form(
                                    key: _formKey,
                                    child: Column(
                                        children: [
                                            MyTextField(
                                                labelText: 'Email',
                                                hintText: 'youremail@email.com',
                                                validator: (emailValue) {
                                                    email = emailValue;
                                                    return null;
                                                },
                                            ),
                                            MyTextField(
                                                isPasswordField: true,
                                                labelText: 'Password',
                                                hintText: 'x7ksdfy9',
                                                margin: EdgeInsets.only(bottom: 10),
                                                validator: (passwordValue) {
                                                    password = passwordValue;
                                                    return null;
                                                },
                                            ),
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                    err != '' ? err : ' ',
                                                    style: TextStyle(
                                                        color: HexColor(hex_danger)
                                                    ),
                                                ),
                                            ),
                                            SizedBox(
                                                height: 30,
                                            ),
                                            FractionallySizedBox(
                                                widthFactor: 1,
                                                child: RaisedButton(
                                                onPressed: (){
                                                    if (_formKey.currentState.validate()) {
                                                        _login();
                                                    }
                                                },
                                                color: HexColor(hex_orange),
                                                elevation: 0,
                                                child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                                    child: Text(
                                                        _isLoading == true ? 'Proccessing...' : 'Login',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: HexColor(hex_white)
                                                        ),
                                                    ),
                                                ),
                                                ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Expanded(
                                                    flex: 2,
                                                    child: Divider(
                                                        color: HexColor(hex_gray),
                                                    ),
                                                    ),
                                                    Flexible(
                                                        flex: 3,
                                                        child: Container(
                                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                                            color: HexColor(hex_white),
                                                            child: Text(
                                                                'Belum punya akun ?',
                                                                style: TextStyle(
                                                                    color: HexColor(hex_gray),
                                                                    fontSize: 10
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Divider(
                                                            color: HexColor(hex_gray),
                                                        ),
                                                    ),
                                                ],
                                                ),
                                            ),
                                            FractionallySizedBox(
                                                widthFactor: 1,
                                                child: OutlineButton(
                                                    onPressed: (){
                                                        Navigator.pushNamed(context, '/register');
                                                    },
                                                    focusColor: HexColor(hex_orange),
                                                    highlightedBorderColor: HexColor(hex_orange),
                                                    borderSide: BorderSide(
                                                        color: HexColor(hex_orange),
                                                    ),
                                                    child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                                        child: Text(
                                                        'Register',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.bold,
                                                            color: HexColor(hex_orange)
                                                        ),
                                                        ),
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                )
                                ],
                            ),
                        )
                    ],
                ),
            ),
        );
    }

    void _login() async{
        setState(() {
            err = '';
            _isLoading = true;
        });
        var data = {
            'email' : email,
            'password' : password
        };

        var res = await Network().authData(data, '/login');
        var body = json.decode(res.body);
        print(body);
        if(body['data'] != null){
            print(body['data']['name']);
            SharedPreferences localStorage = await SharedPreferences.getInstance();
            await localStorage.setString('token', json.encode(body['data']['api_token']));
            await localStorage.setString('user', json.encode(body['data']));
            Navigator.pushNamed(context, '/users');
        }else{
            print(body['status']);
            setState(() {
                err = body['message'];
            });
        }

        setState(() {
            _isLoading = false;
        });

    }
}
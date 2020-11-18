import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/ti_component.dart';
import 'package:project/screen/user/RegristrasiPage.dart';
import 'package:project/screen/user/UserIndex.dart';
import 'package:email_validator/email_validator.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email;
  String password;

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TiComponent(
                          label: "Email",
                          hint:"email@example.com",
                          validate: (String value){
                            if (value.isEmpty){
                              return "Email diperlukan";
                            }else if (!EmailValidator.validate(value)){
                              return "Email TIdak Valid";
                            }else{
                              return null;
                            }
                          },
                          change: (String value){
                            email = value;
                          },
                        ),
                        SizedBox(height: 20.0),
                        TiComponent(
                          label: "Password",
                          hint:"Password",
                          isPassword: true,
                          validate: (String value){
                            if (value.isEmpty){
                              return "Password diperlukan";
                            } else {
                              return null;
                            }
                          },
                          change: (String value){
                            password = value;
                          },
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
                                  if (_formKey.currentState.validate()){
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => UserIndex()));
                                  }
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
                ),
          ],
        ),
      ),
    );
  }
}

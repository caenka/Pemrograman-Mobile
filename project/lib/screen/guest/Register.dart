import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyTextField.dart';
import 'package:project/components/MyHeader.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
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
        // resizeToAvoidBottomInset: false,
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
                    child: MyHeader.Title('Mendaftar', fontSize: 18)
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: MyHeader.Subtitle('Yuk Bergabung bersama Wecare'),
                  ),
                  // FORM 
                  MyTextField(
                    labelText: 'Nama Lengkap',
                    hintText: 'John Doe',
                  ),
                  MyTextField(
                    labelText: 'No Hp',
                    hintText: '085759998xxx',
                  ),
                  MyTextField(
                    labelText: 'Email',
                    hintText: 'youremail@email.com',
                  ),
                  MyTextField(
                    isPasswordField: true,
                    labelText: 'Password',
                    hintText: 'xkadfsfd',
                  ),
                  MyTextField(
                    isPasswordField: true,
                    labelText: 'Konfirmasi Password',
                    hintText: 'Yuk Bergabung bersama Wecare',
                    margin: EdgeInsets.only(bottom: 40),
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
                          'Register',
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
                              'Sudah punya akun ?',
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
                        Navigator.pushNamed(context, '/login');
                      },
                      focusColor: HexColor(hex_orange),
                      highlightedBorderColor: HexColor(hex_orange),
                      borderSide: BorderSide(
                        color: HexColor(hex_orange),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Login',
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
      ),
    );
  }
}
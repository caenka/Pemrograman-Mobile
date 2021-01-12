import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/MyValidation.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';

import 'UserIndex.dart';

class RegristrasiPage extends StatefulWidget {
  @override
  _RegristrasiPageState createState() => _RegristrasiPageState();
}

class _RegristrasiPageState extends State<RegristrasiPage> {
  TextEditingController inputan= new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String nama;
  String email;
  String telepon;
  String alamat;
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
                margin: EdgeInsets.only(bottom: 5, top: 5),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 180,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:5.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      MyValidation(
                        label: "Nama Lengkap",
                        hint:"Nama Lengkap",
                        validate: (String value){
                          if (value.isEmpty){
                            return "Nama Diperlukan";
                          }else{
                            return null;
                          }
                        },
                        change: (String value){
                          nama = value;
                        },
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       labelText: 'Nama Lengkap',
                      //       labelStyle: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           fontWeight: FontWeight.bold,
                      //           color: HexColor(hex_darkorange)
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: HexColor(hex_dark))
                      //       )
                      //   ),
                      // ),
                      SizedBox(height: 10.0),
                      MyValidation(
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
                      SizedBox(height: 10.0),
                      MyValidation(
                        label: "No.Telepon",
                        hint:"081234567890",
                        validate: (String value){
                          if (value.isEmpty){
                            return "No.Telepon Diperlukan";
                          }else{
                            return null;
                          }
                        },
                        change: (String value){
                          telepon = value;
                        },
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       labelText: 'No Telepon',
                      //       labelStyle: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           fontWeight: FontWeight.bold,
                      //           color: HexColor(hex_darkorange)
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: HexColor(hex_dark))
                      //       )
                      //   ),
                      //
                      // ),
                      SizedBox(height: 10.0),
                      MyValidation(
                        label: "Alamat",
                        hint:"Alamat",
                        validate: (String value){
                          if (value.isEmpty){
                            return "Alamat Diperlukan";
                          }else{
                            return null;
                          }
                        },
                        change: (String value){
                          alamat = value;
                        },
                      ),
                      SizedBox(height: 10.0),
                      MyValidation(
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
                      SizedBox(height: 10.0),
                      MyValidation(
                        label: "Konfirmasi Password",
                        hint:"Konfirmasi Password",
                        isPassword: true,
                        validate: (String value){
                          if (value.isEmpty){
                            return "Konfirmasi Password diperlukan";
                          } else {
                            return null;
                          }
                        },
                        change: (String value){
                          password = value;
                        },
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //       labelText: 'Konfirmasi Password',
                      //       labelStyle: TextStyle(
                      //           fontFamily: 'Montserrat',
                      //           fontWeight: FontWeight.bold,
                      //           color: HexColor(hex_darkorange)
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: HexColor(hex_dark))
                      //       )
                      //   ),
                      //   obscureText: true,
                      // ),
                      SizedBox(height: 35.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: HexColor(hex_orange),
                          color: HexColor(hex_darkorange),
                          elevation: 7.0,
                          child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()){
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => UserIndex()));
                                }
                              },
                              child: Center(
                                child: Text('Regristrasi', style: TextStyle(
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
              ),
            ],
        ),
      ),
    );
  }
}

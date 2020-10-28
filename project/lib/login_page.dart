import 'package:flutter/material.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return Scaffold( //mengembalikan scaffold
        resizeToAvoidBottomPadding: false,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.all(50),
                    child: Image.asset(
                        'assets/images/logo.png'
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:350.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFCC80)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE65100))
                              )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFCC80)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE65100))
                              )
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0),
                          padding: EdgeInsets.only(top: 20.0, left: 20.0),
                          child: InkWell(
                              child: Text('Lupa Password ?',
                                  style: TextStyle(
                                      color: Color(0xFFFF8F00),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline)
                              )
                          ),
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Color(0xFFE65100),
                            color: Color(0xFFFF8F00),
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text('Masuk', style: TextStyle(
                                      color: Colors.black,
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
                            Text('Belum punya akun?',
                              style: TextStyle(fontFamily: 'Montserrat'),),
                            SizedBox(width: 10.0),
                            InkWell(
                              onTap: () {},
                              child: Text('Daftar',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
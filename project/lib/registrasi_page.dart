import 'package:flutter/material.dart';
import 'package:project/login_page.dart';


class registrasi extends StatefulWidget {
  static const String routeName="/registrasi";
  @override
  _registrasiState createState() => _registrasiState();
}

class _registrasiState extends State<registrasi> {
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
                    padding: EdgeInsets.only(top: 20, left:100, right: 70),
                    child: Image.asset(
                      'assets/images/logo.png',
                      //alignment: Icons.format_align_center.right,
                      height: 200,
                      width: 200,



                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:180.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
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
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'No Telepon',
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
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Alamat',
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
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Konfirmasi Password',
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
                        //SizedBox(height: 5.0),
                        //Container(
                        //alignment: Alignment(1.0, 0),
                        //padding: EdgeInsets.only(top: 20.0, left: 20.0),
                        //child: InkWell(
                        //child: Text('Lupa Password ?',
                        //style: TextStyle(
                        //  color: Color(0xFFFF8F00),
                        //fontWeight: FontWeight.bold,
                        //fontFamily: 'Montserrat',
                        //decoration: TextDecoration.underline)
                        //)
                        //),
                        //),
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
                                  child: Text('Registrasi', style: TextStyle(
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
                          Text('Sudah punya akun?',
                            style: TextStyle(fontFamily: 'Montserrat'),),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                           child: Text('Masuk',
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
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'home_page.dart';
import 'history.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) { //menampilkan sesuai dengan widget yang dikembalikan oleh method build
    return Scaffold( //mengembalikan scaffold
        backgroundColor: Color(0xfffffaf9f0),
        resizeToAvoidBottomPadding: false,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget> [

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: CircleAvatar(
                        //backgroundColor: Color(0xffFDCF09),
                        //margin: EdgeInsets.only(top: Mediaqury.of(context.size.height *0.44)),
                        //borderRadius: ,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        radius: 80,
                        child: CircleAvatar(radius: 50,
                            backgroundImage: AssetImage('assets/images/cob.png')),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:320.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 255,top: 35.0),
                          child: Text(
                            'Nama',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 170,top: 5.0),
                          child: Text(
                            'Zihan Calvin Cae',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 255,top: 15.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 125,top: 5.0),
                          child: Text(
                            'abcdefxw@gmai.com',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 250,top: 15.0),
                          child: Text(
                            'No HP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 180,top: 5.0),
                          child: Text(
                            '081234567891',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 245,top: 15.0),
                          child: Text(
                            'Alamat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50,top: 5.0),
                          child: Text(
                            'Sumbersari. Kabupaten Jember',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18.0),
                          ),
                        ),

                        SizedBox(height: 35.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            shadowColor: Color(0xFFE65100),
                            color: Color(0xFFFd19b1d),
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: () {
                                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => home()));
                                },
                                child: Center(
                                  child: Text('Edit', style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                  ),
                                )
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
        )

      //==============================================Navbar===================================================
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
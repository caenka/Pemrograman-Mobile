import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/presentation/custom_icon_icons.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body:Column(
        children:<Widget>[
          Container(
            //padding: EdgeInsets.only(top: 50.0),
            child: Stack(
              children: <Widget>[
                Container(
                  width:MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *0.20),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),
                Container(
                  width:MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 280,left: 120.0),
                        child: Text(
                          'Yuk Berbagi',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 40.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Pilih Salah Satu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15.0,),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.57),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.22),
                        // padding: EdgeInsets.only(left: 57.0,top: 430.0),
                        child: Text(
                          'Money To Stuff',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,),
                        ),
                      ),
                      SizedBox(width: 60,),
                      Container(
                        // padding: EdgeInsets.only(left: 100.0,top: 430.0),
                        child: Text(
                          'Money To Money',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,),
                        ),
                      ),
                    ],
                  ),
                ),

                //================================Icon===========================================
                // SizedBox(height: MediaQuery.of(context).size.height * 0.5,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.44),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color : Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red,
                                    spreadRadius: 5,
                                    blurRadius: 5, // changes position of shadow
                                  )
                                ],
                              ),
                              child: Icon(CustomIcon.donation, size: 50.0),

                            ),
                          ),
                          SizedBox(width: 60,),
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              //margin:EdgeInsets.only(left:10.0),
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(

                                color : Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red,
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: Offset(0,0), // changes position of shadow
                                  )
                                ],
                              ),
                              child: Icon(CustomIcon.donate, size: 50.0),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.0,left: 30.0),
                        width: MediaQuery.of(context).size.width*0.81,
                        child: Image.asset('assets/images/Gb.png'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
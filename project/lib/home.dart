//import 'dart:html';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:project/presentation/custom_icon_icons.dart';

// ignore: camel_case_types
class home extends StatefulWidget{
  static const String routeName="/home";
  @override
  homeState createState()=> homeState();
}
// ignore: camel_case_types
class homeState extends State <home>{
  int currentIndex ;

  @override
  void initState() {
    super.initState();
    currentIndex=0;
  }

  changePage(int index){
    setState(() {
      currentIndex=index;
    });
  }
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
                        'assets/images/logo.png'
                    ),
                  ),
                  Container(
                    width:MediaQuery.of(context).size.height,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //margin: EdgeInsets.only(top: 280,left: 120.0),
                          child: Text(
                            'Yuk Berbagi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontSize: 40.0),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Pilih Salah Satu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
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
                          margin: EdgeInsets.only(top: 4.0,left: 30.0),
                          width: MediaQuery.of(context).size.width,
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
        //==============================================Navbar===================================================
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BubbleBottomBar(
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.home, color: Colors.black),
                activeIcon: Icon(Icons.home, color: Colors.red),
                title: Text('Home')
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(Icons.access_time, color: Colors.black),
                activeIcon: Icon(Icons.access_time, color: Colors.red),
                title: Text('Riwayat')
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(LineAwesomeIcons.user, color: Colors.black),
                activeIcon: Icon(LineAwesomeIcons.user, color: Colors.red),
                title: Text('Profile')
            ),
          ],
          opacity: 0.2,
          backgroundColor: Colors.white,
          //borderRadius: BorderRadius.horizontal(left: Radius.circular(50.0)),
          currentIndex: currentIndex ,
          //hasInk: true,
          //inkColor: Colors.black12,
          //hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
        )
    );
  }

}
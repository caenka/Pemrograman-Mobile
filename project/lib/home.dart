import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
        backgroundColor: Colors.amber,
        body:Column(
          children:<Widget>[
            Container(
              //padding: EdgeInsets.only(top: 50.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:70.0),
                    width:250,
                    child: Image.asset(
                        'assets/images/logo.png'
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0,top: 250.0),
                    child: Text(
                      'Hallo',
                      style: TextStyle(
                          fontSize: 20.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0,top: 280.0),
                    child: Text(
                      'Nama Saya Siapa',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //================================Icon===========================================
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.5,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.5),
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
                            SizedBox(width: 30,),
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
                          margin: EdgeInsets.only(top: 6.0,left: 30.0),
                          width: 400.0,
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
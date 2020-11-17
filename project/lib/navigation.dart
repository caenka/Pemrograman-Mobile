import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:project/profile.dart';
import 'home_page.dart';
import 'history.dart';
import 'profile.dart';
// ignore: camel_case_types
class navigation extends StatefulWidget{
  static const String routeName="/navigation";
  @override
  navigationState createState()=> navigationState();
}
// ignore: camel_case_types
class navigationState extends State <navigation>{
  int currentIndex ;
  final List<Widget> _children = [
    HomePage(),
    HistoryWidget(),
    Profile(),

  ];
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
        body: _children[currentIndex],

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
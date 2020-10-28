import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/login_page.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                icon: Icon(Icons.account_box, color: Colors.black),
                activeIcon: Icon(Icons.account_box, color: Colors.red),
                title: Text('Profile')
            )
          ],
          opacity: 0.2,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          currentIndex: currentIndex ,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
        )
    );
  }

}
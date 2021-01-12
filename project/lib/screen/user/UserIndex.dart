import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

// Page
import 'package:project/screen/user/ProfilePage.dart';
import 'package:project/screen/user/HomePage.dart';
import 'package:project/screen/user/HistoryPage.dart';

class UserIndex extends StatefulWidget {
  @override
  _UserIndexState createState() => _UserIndexState();
}

class _UserIndexState extends State<UserIndex> {
    int currentIndex;

    final List<Widget> _children = [
        HomePage(),
        HistoryPage(),
        ProfilePage()
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
      appBar: AppBar(
        backgroundColor: HexColor(hex_orange),
        automaticallyImplyLeading: false,
        title: Text('Wecare'),
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: HexColor(hex_orange),
              icon: Icon(Icons.home, color: HexColor(hex_dark)),
              activeIcon: Icon(Icons.home, color: HexColor(hex_orange)),
              title: Text('Home')
          ),
          BubbleBottomBarItem(
              backgroundColor: HexColor(hex_orange),
              icon: Icon(Icons.access_time, color: HexColor(hex_dark)),
              activeIcon: Icon(Icons.access_time, color: HexColor(hex_orange)),
              title: Text('Riwayat')
          ),
          BubbleBottomBarItem(
              backgroundColor: HexColor(hex_orange),
              icon: Icon(LineAwesomeIcons.user, color: HexColor(hex_dark)),
              activeIcon: Icon(LineAwesomeIcons.user, color: HexColor(hex_orange)),
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
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        onTap: changePage,
      )
    );
  }
}
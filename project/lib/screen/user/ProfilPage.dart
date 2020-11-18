import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyHeader.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(hex_white),
        body: MyContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                child: Stack(
                  children: <Widget> [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: CircleAvatar(
                          radius: 80,
                          child: CircleAvatar(radius: 50,
                              backgroundImage: AssetImage('assets/images/cob.png')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: MyHeader.Title('Nama Lengkap'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: MyHeader.Subtitle('Cae Zihan Calvin'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: MyHeader.Title('Email'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: MyHeader.Subtitle('Youremail@gmail.com'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: MyHeader.Title('No Telepon'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: MyHeader.Subtitle('081234567890'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: MyHeader.Title('Alamat'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: MyHeader.Subtitle('Jl. Jawa, Sumbersari, Kabupaten Jember'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35.0),
                Container(
                  height: 40.0,
                  width: 140.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: HexColor(hex_orange),
                    color: HexColor(hex_darkorange),
                    elevation: 7.0,
                    child: InkWell(
                      onTap: () {
                      //Navigator.push(context, new MaterialPageRoute(builder: (context) => home()));
                      },
                      child: Center(
                        child: Text('Edit', style: TextStyle(
                          color: HexColor(hex_light),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'
                          ),
                        ),
                      )
                    ),
                  ),
                ),

            ],
          )
        ),
    );
  }
}
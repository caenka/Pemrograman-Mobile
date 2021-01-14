import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histori Donasiku',style: TextStyle(color : Color(0xFFE65100)),),backgroundColor: Colors.white,iconTheme: IconThemeData(color: Color(0xFFE65100)),),
      body: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatelessWidget{
  var data = [
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
    [
      new DateTime.now(),
      'BCA',
      'Sopyan',
      1000000,
      'Success'
    ],
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.amber,
        body : new ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context ,int index){
            return new Card(
                child : Column(
                  children: <Widget>[
                    const ListTile(

                      title :Text("Nama Pengirim"),
                      subtitle: Text("04 Oktober 2020\nBank BCA\nRp.1000.1000"),
                      trailing: Chip(backgroundColor: Color(0xFFFF8F00),label: Text("Sukses",style: TextStyle(color : Colors.white),)),
                    ),
                  ],
                )
            );
          },)
    );
  }
}
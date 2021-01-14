import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/api.dart';
import 'package:project/components/CardHistory.dart';
import 'package:project/model/Donation.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyTextField.dart';
import 'package:project/components/MyHeader.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
 

  // FOR FOCUS INPUT
  FocusNode _focusNode = new FocusNode();
  List<Donation> donations;

  @override
      void initState() {
      super.initState();
      // populateData();
      loadData();
  }

  void loadData() async {
        print('load All');

        var res = await Network().authGetData('/donations');
        var body = jsonDecode(res.body);
        print(body);
        List<Donation> tempList = await body['data'].map<Donation>((item) => (Donation.fromJson(item))).toList();
        setState(() {
            donations = tempList;
        });
        
    }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: HexColor(hex_white),
        body: MyContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              // ROW TITLE
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: MyHeader.Title('History Donasi'),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: MyHeader.Subtitle('History Donasi Saya'),
                      ),
                      
                    ],
                  ),
                ],
              ),
              // END OF ROW TITLE 

              // CARD LIST
              ConstrainedBox(
                constraints:  BoxConstraints(
                    minHeight: 50
                ),
                child: donations != null ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: donations.length,
                  itemBuilder: (BuildContext context ,int index) {
                    return CardHistory(
                      type: donations[index].donationTypeId == 1 ? 'uang' : 'barang',
                      cardTitle: 'Donasi ${donations[index].donationTypeId == 1 ? 'uang' : 'barang'}',
                      cardDate: '${donations[index].createdAt}',
                      cardNominal: '${donations[index].totalPrice}',
                    );
                  },
                ) : Text('Waiting data...'),
              )
              // END OF CARD LIST
            ],
          ),
        ),
      ),
    );
  }
}
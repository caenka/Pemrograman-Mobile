import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/CardHistory.dart';

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
                      MyHeader.Subtitle('History Donasi Saya')
                    ],
                  ),
                ],
              ),
              // END OF ROW TITLE 

              // INPUT SEARCH
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 20),
                child: MyTextField(
                  labelText: 'Cari History',
                  hintText: 'Masukan History',
                  suffixIcon: Icons.search,
                ),
              ),
              // END OF INPUT SEARCH

              // CARD LIST
              Container(
                height: 400,
                clipBehavior: Clip.none,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context ,int index) {
                    return CardHistory(
                      type: 'barang',
                      cardBank: 'Mandiri',
                      cardTitle: 'Donasi Barang : Baju Bekas',
                      cardDate: '2 Januari 2020',
                      cardNominal: 'Rp. 100.000',
                      cardStatus: 'Batal',
                    );
                  },
                ),
              )
              // END OF CARD LIST
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

class CardHistory extends StatelessWidget {
  // (UANG/BARANG) ONLY
  String type;
  String cardDate;
  String cardTitle;
  String cardBank;
  String cardNominal;
  String cardStatus;

  CardHistory({
    Key key,
    this.type,
    @required this.cardDate,
    @required this.cardTitle,
    @required this.cardBank,
    @required this.cardNominal,
    @required this.cardStatus
  }) : super(key: key);

  getStatusColor() {
    if(this.cardStatus.toLowerCase() == 'sukses') {
      return HexColor(hex_green);
    } else if(this.cardStatus.toLowerCase() == 'batal') {
      return HexColor(hex_orange);
    } else {
      return HexColor(hex_gray);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: HexColor(hex_muted)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // CARD
          Positioned(
            child: Container(
              height: 120,
              color: HexColor(hex_light),
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // COLUMN ICON
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8, right: 12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 68,
                            height: 68,
                            color: this.getStatusColor(),
                            child: Center(
                              child: Icon(
                                this.type == 'barang' ? Icons.markunread_mailbox : Icons.attach_money,
                                color: HexColor(hex_white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        this.cardDate,
                        style: TextStyle(
                          color: HexColor(hex_gray),
                          fontSize: 9
                        ),
                      ),
                    ],
                  ),

                  // COLUMN DATA
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            this.cardTitle,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: HexColor(hex_dark)
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.account_balance_wallet,
                                color: HexColor(hex_green),
                                size: 12,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                this.cardBank,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: HexColor(hex_green)
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.info,
                                color: HexColor(hex_gray),
                                size: 24,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: HexColor(hex_softgray),
                        ),
                        Text(
                          this.cardNominal,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: this.getStatusColor(),
                            fontSize: 12
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // BADGE
          Positioned(
            top: -10,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 60,
                height: 20,
                color: this.getStatusColor(),
                child: Center(
                  child: Text(
                    this.cardStatus,
                    style: TextStyle(
                      color: HexColor(hex_white),
                      fontSize: 12
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
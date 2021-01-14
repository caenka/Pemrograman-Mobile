import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/api.dart';
import 'package:project/components/MyHeader.dart';
import 'package:project/model/Good.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';

class GoodPage extends StatefulWidget {
    @override
    _GoodPageState createState() => _GoodPageState();
}

class _GoodPageState extends State<GoodPage> {
    String err = '';

    List<ListItem<Good>> goods;
    List<Good> goodSelected = new List();
    String goodType = 'sembako';
    bool _isLoad = true;
    

    @override
        void initState() {
        super.initState();
        // populateData();
        loadData();
        goodSelected = new List();
    }

    void loadData() async {
        print('load All');
        setState(() {
          _isLoad = true;
        });

        var res = await Network().authGetData('/goods?type=$goodType');
        var body = jsonDecode(res.body);
        print(body);
        List<ListItem<Good>> tempList = await body['data'].map<ListItem<Good>>((item) => ListItem<Good>(Good.fromJson(item))).toList();
        setState(() {
            goods = tempList;
        });
        
        setState(() {
          _isLoad = false;
        });
    }
    
    // void populateData() {
    //     indexList = [];
    //     for (int i = 0; i < 10; i++) {
    //         indexList.add(ListItem<String>("item $i"));
    //     }
    // }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: HexColor(hex_orange),
                title: Text('Wecare'),
            ),
            floatingActionButton: Container(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                    onPressed: (){
                        setState(() {
                            err = '';
                        });
                        if (goodSelected.length < 1) {
                            setState(() {
                                err = 'Pilih barang dulu untuk didonasikan';
                            });
                        } else {
                            Navigator.pushNamed(
                                context, 
                                '/donations/calculate',
                                arguments: goodSelected,
                            );
                        }
                    },
                    child: Text('Kalkulasi'),
                    backgroundColor: HexColor(hex_orange),
                ),
            ),
            body: MyContainer(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            err != '' ? Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(bottom: 20),
                                width: double.infinity,
                                color: Colors.redAccent,
                                child: MyHeader.Title(err, fontSize: 18, color: HexColor(hex_white))
                            ) : Text(''),
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: MyHeader.Title('Donasi Uang ke Barang', fontSize: 18)
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: MyHeader.Subtitle('Pilih Barang dulu untuk di donasikan'),
                            ),
                            // BADGE CATEGORY
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: HexColor(hex_orange))
                                        ),
                                        onPressed: (){
                                            setState(() {
                                                goodType = 'sembako';
                                                goodSelected = new List();
                                            });
                                            loadData();
                                        },
                                        color: HexColor(goodType == 'sembako' ? hex_orange : hex_white),
                                        child: Text(
                                            'Sembako',
                                            style: TextStyle(
                                                color: HexColor(goodType == 'sembako' ? hex_white : hex_orange)
                                            ),
                                        )
                                    ),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: HexColor(hex_orange))
                                        ),
                                        onPressed: (){
                                            setState(() {
                                                goodType = 'pakaian';
                                                goodSelected = new List();
                                            });
                                            loadData();
                                        },
                                        color: HexColor(goodType == 'pakaian' ? hex_orange : hex_white),
                                        child: Text(
                                            'Pakaian',
                                            style: TextStyle(
                                                color: HexColor(goodType == 'pakaian' ? hex_white : hex_orange)
                                            ),
                                        )
                                    ),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: HexColor(hex_orange))
                                        ),
                                        onPressed: (){
                                            setState(() {
                                                goodType = 'barang';
                                                goodSelected = new List();
                                            });
                                            loadData();
                                        },
                                        color: HexColor(goodType == 'barang' ? hex_orange : hex_white),
                                        child: Text(
                                            'Barang',
                                            style: TextStyle(
                                                color: HexColor(goodType == 'barang' ? hex_white : hex_orange)
                                            ),
                                        )
                                    ),
                                ],
                            ),
                            SizedBox(
                                height: 20,
                            ),

                            // Goods Data
                            goods != null ? Container(
                                height: 300,
                                child: GridView.builder(
                                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                    itemCount: goods.length,
                                    itemBuilder: CardGood,
                                ),
                            ) : Text('Loading Data...')
                        ],
                    ),
                )
            ),
        );
    }

    
    Widget CardGood(BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
                if (goods.any((item) => item.isSelected)) {
                    setState(() {
                        if (goodSelected.contains(goods[index].data)) {
                            goodSelected.remove(goods[index].data);
                        } else {
                            goodSelected.add(goods[index].data);
                        }
                        goods[index].isSelected = !goods[index].isSelected;
                    });
                    print(goodSelected);
                } 
            },
            onLongPress: () {
                setState(() {
                    goods[index].isSelected = true;
                    goodSelected.add(goods[index].data);
                });
                print(goodSelected);
            },
            child: Container(
                height: 120,
                child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: goods[index].isSelected ? HexColor(hex_orange) : HexColor(hex_softgray)
                            )
                        ),
                        child: Column(
                            children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 10),
                                    alignment: Alignment.center,
                                    width: 75,
                                    height: 75,
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image:  NetworkImage(Network().getBaseUrl()+goods[index].data.photo),
                                    ),
                                ),
                                MyHeader.Title(
                                    goods[index].data.name,
                                    color: goods[index].isSelected ? HexColor(hex_orange) : HexColor(hex_dark),
                                    fontSize: 18
                                ),
                                MyHeader.Subtitle(
                                    'Rp ${goods[index].data.price}',
                                    color: goods[index].isSelected ? HexColor(hex_green) : HexColor(hex_gray),
                                    fontSize: 16
                                )
                            ],
                        ),
                    )
                ),
            ),
        );
    }
}

class ListItem<T> {
    bool isSelected = false; //Selection property to highlight or not
    T data; //Data of the user
    ListItem(this.data); //Constructor to assign the data
}
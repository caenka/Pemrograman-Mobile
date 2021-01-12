import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/components/MyHeader.dart';

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
    List<ListItem<String>> indexList;
    List<int> indexsSelected = new List();

    @override
        void initState() {
        super.initState();
        populateData();
    }
    
    void populateData() {
        indexList = [];
        for (int i = 0; i < 10; i++) {
            indexList.add(ListItem<String>("item $i"));
        }
    }

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
                        Navigator.pushNamed(context, '/donations/calculate');
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
                                        ),
                                        onPressed: (){},
                                        color: HexColor(hex_orange),
                                        child: Text(
                                            'Sembako',
                                            style: TextStyle(
                                                color: HexColor(hex_white)
                                            ),
                                        )
                                    ),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: HexColor(hex_orange))
                                        ),
                                        onPressed: (){},
                                        color: HexColor(hex_white),
                                        child: Text(
                                            'Paikaian',
                                            style: TextStyle(
                                                color: HexColor(hex_orange)
                                            ),
                                        )
                                    ),
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: HexColor(hex_orange))
                                        ),
                                        onPressed: (){},
                                        color: HexColor(hex_white),
                                        child: Text(
                                            'Barang',
                                            style: TextStyle(
                                                color: HexColor(hex_orange)
                                            ),
                                        )
                                    ),
                                ],
                            ),
                            SizedBox(
                                height: 20,
                            ),
                            // search input
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Cari Sembako',
                                        suffixIcon: Container(
                                        color: HexColor(hex_orange),
                                        padding: EdgeInsets.only(top: 0.0, right: 0.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                            Text(
                                                'Cari',
                                                style: TextStyle(
                                                    color: HexColor(hex_white),
                                                    fontWeight: FontWeight.bold),
                                            ),
                                            ],
                                        )
                                        ),
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: HexColor(hex_orange),
                                            fontSize: 14.0
                                        ),
                                        isDense: true,
                                        hintText: 'Ketikan Nama Sembako',
                                        hintStyle: TextStyle(
                                            color: HexColor(hex_gray),
                                            fontSize: 14.0
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: HexColor(hex_orange)),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                    ),
                                ),
                            ),

                            // Goods Data
                            Container(
                                height: 300,
                                child: GridView.builder(
                                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                    itemCount: indexList.length,
                                    itemBuilder: CardGood,
                                ),
                            )
                        ],
                    ),
                )
            ),
        );
    }

    
    Widget CardGood(BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
                if (indexList.any((item) => item.isSelected)) {
                    setState(() {
                        if (indexsSelected.contains(index)) {
                            indexsSelected.remove(index);
                        } else {
                            indexsSelected.add(index);
                        }
                        indexList[index].isSelected = !indexList[index].isSelected;
                    });
                } 
                print(indexsSelected);
            },
            onLongPress: () {
                setState(() {
                    indexList[index].isSelected = true;
                    indexsSelected.add(index);
                });
            },
            child: Container(
                height: 120,
                child: Card(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: indexList[index].isSelected ? HexColor(hex_orange) : HexColor(hex_softgray)
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
                                        image: AssetImage('assets/images/beras.png'),
                                    ),
                                ),
                                MyHeader.Title(
                                    'Beras',
                                    color: indexList[index].isSelected ? HexColor(hex_orange) : HexColor(hex_dark),
                                    fontSize: 18
                                ),
                                MyHeader.Subtitle(
                                    'Rp. 50.000',
                                    color: indexList[index].isSelected ? HexColor(hex_green) : HexColor(hex_gray),
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
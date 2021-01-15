import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:project/api.dart';
import 'package:project/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/api.dart';

// Project Dependency
import 'package:project/components/MyHeader.dart';
import 'package:project/model/Good.dart';
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';


class CalculatePage extends StatefulWidget {
    
    @override
    _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
    User user = null;

    File _image;
    String _retrieveDataError;
    dynamic _pickImageError;
    PickedFile _imageFile;
    String base64Image;
    final ImagePicker _picker = ImagePicker();

    List<Good> goodSelected = new List();
    int totalPrice = 0;
    List<Map<String, dynamic>> detail_donation = new List();


    void initState() {
        super.initState();
        getGoods();
        getUser();
    }

    void getUser() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        user = User.fromJson( json.decode(localStorage.get('user')) );
    }

    void getGoods() async {
        await Future.delayed(Duration.zero, () {  
            setState(() {
                goodSelected = ModalRoute.of(context).settings.arguments;
            });
            getTotalPrice();
        });
    }

    void getTotalPrice() {
        if (goodSelected != null) {
            for (int i = 0; i < goodSelected.length; i++) {
                setState(() {
                    totalPrice += goodSelected[i].price;
                    detail_donation.add({
                        "id" : goodSelected[i].id,
                        "quantity" : 1
                    });
                });
            }
            print(detail_donation);
        }
    }

    void store() async {
        var data = {
            'total_price': totalPrice,
            'image' : base64Image != null ? _imageFile : null,
            'attachment': _imageFile != null ? File(_imageFile.path).path.split('/').last : null,
            'user_id' : 1,
            'donation_type_id': 2,
            'goods' : detail_donation,
        };

        var res = await Network().authPostData(data, '/donations');
        var body = await json.decode(res.body);
        print(body['data']);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: HexColor(hex_orange),
                title: Text('Wecare'),
            ),
            body: MyContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MyHeader.Title('Kalkulasi Donasi')
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: MyHeader.Subtitle('Klik Kembali untuk Membatalkan'),
                        ),
                        // goods
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MyHeader.Title('Donasi Sembako', fontSize: 14)
                        ),
                        // goods list
                        goodSelected != null ? ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 50
                            ),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: goodSelected.length,
                                itemBuilder: (context, index) {
                                    return GoodCalculated(
                                        good: goodSelected[index],
                                        callback: (quantity, operatoin) {
                                            int tempTotal = goodSelected[index].price * operatoin;
                                            setState(() {
                                                detail_donation[index].update('quantity', (value) => quantity);
                                            });
                                            setState(() {
                                                totalPrice += tempTotal;
                                            });
                                            print(detail_donation);
                                        },
                                    );
                                }
                            ),
                        ) : Text('Loading Data...'),
                        // payment
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MyHeader.Title('Pembayaran', fontSize: 14)
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: HexColor(hex_dark)
                                )
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: MyHeader.Title('Total Donasi', fontSize: 14)
                                    ),
                                    MyHeader.Title('Rp. ${totalPrice}', fontSize: 18, color: HexColor(hex_orange))
                                ],
                            ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: HexColor(hex_dark)
                                )
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    MyHeader.Title('Rekening', fontSize: 18, color: HexColor(hex_dark)),
                                    MyHeader.Title(
                                        '123124235', 
                                        fontSize: 18, 
                                        color: HexColor(hex_dark)
                                    )
                                ],
                            ),
                        ),
                        // attacment
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MyHeader.Title('Bukti Pembayaran', fontSize: 14)
                        ),
                        Row(
                            children: [
                              Expanded(
                                child: OutlineButton(
                                  onPressed: (){
                                      try {
                                          chooseImageCamera();
                                      } catch (err) {}
                                  },
                                  focusColor: HexColor(hex_orange),
                                  highlightedBorderColor: HexColor(hex_orange),
                                  borderSide: BorderSide(
                                      color: HexColor(hex_orange),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                      'Kamera',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(hex_orange)
                                      ),
                                      ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: OutlineButton(
                                  onPressed: (){
                                      try {
                                          chooseImageGalery();
                                      } catch (err) {}
                                  },
                                  focusColor: HexColor(hex_orange),
                                  highlightedBorderColor: HexColor(hex_orange),
                                  borderSide: BorderSide(
                                      color: HexColor(hex_orange),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                      'Galeri',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor(hex_orange)
                                      ),
                                      ),
                                  ),
                                ),
                              ),
                            ],
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: showImage()
                        ),
                        FractionallySizedBox(
                            widthFactor: 1,
                            child: RaisedButton(
                                onPressed: (){
                                    store();
                                    Navigator.pushNamed(context, '/donations/done');
                                }, 
                                color: HexColor(hex_orange), 
                                elevation: 0, 
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                    'Selesaikan',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(hex_white)
                                    ),
                                    ),
                                ),
                            ),
                        ),
                    ]   
                )
            )
        );
    }

    chooseImageGalery() async {
        try {
            var pickedFile = await _picker.getImage(
                source: ImageSource.gallery,
            );
            setState(() {
                _imageFile = pickedFile;
                base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
            });
            } catch (e) {
            setState(() {
                _pickImageError = e;
            });
        }
    }

    chooseImageCamera() async {
        try {
            var pickedFile = await _picker.getImage(
                source: ImageSource.camera,
            );
            setState(() {
                _imageFile = pickedFile;
                base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
            });
        } catch (e) {
            setState(() {
                _pickImageError = e;
            });
        }
    }

    Future<void> retrieveLostData() async {
        final LostData response = await _picker.getLostData();
        if (response.isEmpty) {
        return;
        }
        if (response.file != null) {
        setState(() {
            _imageFile = response.file;
            base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
        });
        } else {
        _retrieveDataError = response.exception.code;
        }
    }

    Widget previewImage() {
        if (_imageFile != null) {
            return Container(
                width: double.infinity,
                height: 160,
                child: Image.file(
                File(_imageFile.path),
                fit: BoxFit.cover,
                ),
            );
        } else {
            return Container(
                width: double.infinity,
                height: 160,
                child: Center(
                child: Text('No Image Upload')
                ),
                decoration: BoxDecoration(
                color: HexColor(hex_light),
                borderRadius: BorderRadius.circular(5)
                ),
            );
        }
    }

    Widget showImage() {
        return FutureBuilder<void>(
            future: retrieveLostData(), 
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
                return const Text(
                'You have not yet picked an image.',
                textAlign: TextAlign.center,
                );
            case ConnectionState.done:
                
                return previewImage();
            default:
                if (snapshot.hasError) {
                return Text(
                    'Pick image/video error: ${snapshot.error}}',
                    textAlign: TextAlign.center,
                );
                } else {
                return const Text(
                    'You have not yet picked an image.',
                    textAlign: TextAlign.center,
                );
                }
            }
        },
        );
    }
}

typedef IntCallback = Function(int num1, int num2);

class GoodCalculated extends StatefulWidget {
    IntCallback callback;
    Good good;

    GoodCalculated({
        Key key,
        @required this.good,
        this.callback
    }) : super(key: key);

    @override
    _GoodCalculatedState createState() => _GoodCalculatedState();
}

class _GoodCalculatedState extends State<GoodCalculated> {
    int quantity = 1;
    int operation = 0;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
                border: Border.all(
                    color: HexColor(hex_orange)
                )
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 35,
                        height: 35,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(Network().getBaseUrl()+widget.good.photo),
                        ),
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: MyHeader.Title(widget.good.name, fontSize: 14)
                                ),
                                Container(
                                    child: MyHeader.Title('Rp. ${widget.good.price}', fontSize: 14, color: HexColor(hex_orange))
                                ),
                            ],
                        ),
                    ),
                    Flexible(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                                FlatButton(
                                    minWidth: 18,
                                    height: 18,
                                    padding: EdgeInsets.all(4),
                                    onPressed: () {
                                        if (quantity > 1) {
                                            if (operation > 0) {
                                                setState(() {
                                                    operation = 0;
                                                });
                                            }
                                            setState(() {
                                                quantity--;
                                                operation = -1;
                                            });
                                            widget.callback(quantity,operation);
                                        }
                                    }, 
                                    color: HexColor(hex_light),
                                    child: Icon(
                                        Icons.indeterminate_check_box,
                                        color: HexColor(hex_orange),
                                        size: 24,
                                    )
                                ),
                                Text(
                                    '$quantity'
                                ),
                                FlatButton(
                                    minWidth: 18,
                                    height: 18,
                                    padding: EdgeInsets.all(4),
                                    onPressed: () {
                                        if (quantity < 10) {
                                            if (operation < 0) {
                                                setState(() {
                                                    operation = 0;
                                                });
                                            }
                                            setState(() {
                                                quantity++;
                                                operation = 1;
                                            });
                                            widget.callback(quantity,operation);
                                        }
                                    }, 
                                    color: HexColor(hex_light),
                                    child: Icon(
                                        Icons.add_box,
                                        color: HexColor(hex_orange),
                                        size: 24,
                                    )
                                ),
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}
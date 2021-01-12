import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

// Project Dependency
import 'package:project/components/MyHeader.dart';
import 'package:project/variable/Colors.dart';
import 'package:project/components/MyContainer.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';


class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
    File _image;
    String _retrieveDataError;
    dynamic _pickImageError;
    PickedFile _imageFile;
    String base64Image;
    final ImagePicker _picker = ImagePicker();

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
                        ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 200
                            ),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                    return GoodCalculated(
                                        callback: (value) {
                                            print('index of $index has quantity $value');
                                        },
                                    );
                                }
                            ),
                        ),
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
                                    MyHeader.Title('Rp. 150000', fontSize: 18, color: HexColor(hex_orange))
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
                                    MyHeader.Title('Rp. 150000', fontSize: 18, color: HexColor(hex_dark))
                                ],
                            ),
                        ),
                        // attacment
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: MyHeader.Title('Bukti Pembayaran', fontSize: 14)
                        ),
                        FractionallySizedBox(
                            widthFactor: 1,
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
                                    'Upload Bukti Pembayaran',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(hex_orange)
                                    ),
                                    ),
                                ),
                            ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: showImage()
                        ),
                        FractionallySizedBox(
                            widthFactor: 1,
                            child: RaisedButton(
                                onPressed: (){
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

typedef IntCallback = Function(int num);

class GoodCalculated extends StatefulWidget {
    IntCallback callback;

    GoodCalculated({
        Key key,
        this.callback
    }) : super(key: key);

    @override
    _GoodCalculatedState createState() => _GoodCalculatedState();
}

class _GoodCalculatedState extends State<GoodCalculated> {
    int quantity = 0;

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
                            image: AssetImage('assets/images/beras.png'),
                        ),
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: MyHeader.Title('Beras', fontSize: 14)
                                ),
                                Container(
                                    child: MyHeader.Title('Rp. 50.000', fontSize: 14, color: HexColor(hex_orange))
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
                                        if (quantity > 0) {
                                            setState(() {
                                                quantity--;
                                            });
                                            widget.callback(quantity);
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
                                            setState(() {
                                                quantity++;
                                            });
                                            widget.callback(quantity);
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
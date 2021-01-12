import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

// Component Dependency
import 'package:project/components/MyContainer.dart';
import 'package:project/components/MyTextField.dart';
import 'package:project/components/MyHeader.dart';


class MoneyPage extends StatefulWidget {
    @override
    _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
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
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: MyHeader.Title('Kalkulasi Donasi', fontSize: 18)
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: MyHeader.Subtitle('Pilih Barang dulu untuk di donasikan'),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: MyHeader.Title('Donasi Uang', fontSize: 14)
                            ),
                            MyTextField(
                                isNumber: true,
                                labelText: 'Donasi Uang',
                                hintText: 'Masukan Nominal',
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
                        ],
                    )
                )
            ),
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
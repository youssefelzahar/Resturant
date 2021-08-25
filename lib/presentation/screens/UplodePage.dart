import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study/DataLayer/Typeofdata/Firebasedata.dart';
import 'package:study/presentation/screens/MainScreen.dart';

class Uplode extends StatefulWidget {
  @override
  Uplodestate createState() => Uplodestate();
}

class Uplodestate extends State<Uplode> {
  late String titleofoffers,
      priceofoffers,
      titleofmenu,
      priceofmenu,
      imageuri = "";

//  late File image = File('path');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            TextField(
              decoration:
                  InputDecoration(hintText: 'Enter title of spicialoffers'),
              onChanged: (value) {
                setState(() {
                  this.titleofoffers = value;
                });
              },
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: 'Enter decribtion of price'),
              onChanged: (value) {
                setState(() {
                  this.priceofoffers = value;
                });
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('uplode&openstudio'),
              onPressed: () {
                FirebaseUplode firebaseUplode = FirebaseUplode(
                    name: titleofoffers, imageuris: '', price: priceofoffers);

                firebaseUplode.UplodeOffers();
              },
            ),
            SizedBox(
              width: 10,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter title of menu'),
              onChanged: (value) {
                setState(() {
                  this.titleofmenu = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter  price'),
              onChanged: (value) {
                setState(() {
                  this.priceofmenu = value;
                });
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('uplode&openstudio'),
              onPressed: () {
                FirebaseUplode firebaseUplode = FirebaseUplode(
                    name: titleofmenu, imageuris: imageuri, price: priceofmenu);

                firebaseUplode.UplodeMenu();
              },
            ),
            SizedBox(
              height: 20,
            ),
            // ignore: deprecated_member_use

            SizedBox(
              height: 20,
            ),
            // ignore: deprecated_member_use

            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
          ],
        ))
      ],
    ));
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:study/DataLayer/model/DatatModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUplode extends DataModel {
  FirebaseUplode(
      {required String name, required String imageuris, required String price})
      : super(title: name, price: price, imageuri: imageuris);

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  void UplodeMenu() async {
    final picker = ImagePicker();
    PickedFile pickedImage;
    // ignore: deprecated_member_use
    pickedImage = (await picker.getImage(source: ImageSource.gallery))!;
    File imageFile = File(pickedImage.path);
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("menuimage/" + DateTime.now().toString());
    UploadTask uploadTask = reference.putFile(imageFile);
    imageuri = await (await uploadTask).ref.getDownloadURL();

    Future<DocumentReference> collectionReference = firebaseFirestore
        .collection('menu')
        .add({"title": title, "price": price, "image": imageuri});
  }

  void UplodeOffers() async {
    try {
      final picker = ImagePicker();
      PickedFile pickedImage;
      // ignore: deprecated_member_use
      pickedImage = (await picker.getImage(source: ImageSource.gallery))!;
      File imageFile = File(pickedImage.path);
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("offersimage/" + DateTime.now().toString());
      UploadTask uploadTask = reference.putFile(imageFile);
      imageuri = await (await uploadTask).ref.getDownloadURL();
      Image.network(imageuri.toString());
      await firebaseFirestore
          .collection('offers')
          .add({"title": title, "price": price, "image": imageuri});
    } catch (error) {
      print(error);
    }
    print(imageuri.toString());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study/domains/usecases/auth.dart';

class UserInfo extends StatelessWidget {
  late String username, usermail, userpassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('dataofuser').snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final ds = snapshot.data!.docs[index];
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          ds['username'],
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(ds['usermail'],
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  );
                });
          }),
    );
  }
}

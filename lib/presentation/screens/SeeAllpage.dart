import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeeALL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('menu').snapshots(),
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
                          ds['title'],
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Text(ds['price'],
                            style: TextStyle(color: Colors.black)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 220.0,
                              image: NetworkImage(ds['image'], scale: 1.0),
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  );
                });
          }),
    );
  }
}

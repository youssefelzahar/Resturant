import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:study/DataLayer/Typeofdata/LocalData.dart';
import 'package:study/presentation/model/MenuModel.dart';
import 'package:study/presentation/screens/SeeAllpage.dart';

class Menu extends StatelessWidget {
  late String imageuri, name, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Menu',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SeeALL())),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('menu').snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final post = snapshot.data!.docs[index];
                    MenuModel menuModel = MenuModel(
                        imageUrl: imageuri = post['image'],
                        name: name = post['title'],
                        price: price = post['price']);
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      width: 240.0,
                      child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              child: Container(
                                height: 120.0,
                                width: 240.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          SizedBox(height: 2.0),
                                          Text(
                                            price,
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                            shape: BoxShape.rectangle),
                                        child: RatingBar.builder(
                                          initialRating: 0,
                                          minRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 1,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 220.0,
                                  image: NetworkImage(imageuri, scale: 1.0),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ]),
                    );
                  },
                );
              }),
        )
      ],
    );
  }
}

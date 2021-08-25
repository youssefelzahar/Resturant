import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/domains/usecases/auth.dart';

class Comments extends StatelessWidget {
  String sname = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(25)),
          Row(
            children: [
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(
                              "https://i.imgur.com/BoN9kdC.png")))),
              new Text("John Doe", textScaleFactor: 1.5)
            ],
          ),
          SizedBox(
            height: 360,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Comment",
                  prefixIcon: Icon(Icons.comment),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                onChanged: (value) {
                  this.sname = value;
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

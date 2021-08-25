import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/presentation/screens/MainScreen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(100)),

            Image.asset('assets/images/logo.png'),

            SizedBox(
              height: 20,
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: EdgeInsets.only(right: 150, top: 100),
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding: EdgeInsets.only(right: 70, left: 65),
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.red)),
                child: Text(
                  'Continue',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

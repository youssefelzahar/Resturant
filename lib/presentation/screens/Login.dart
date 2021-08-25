import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/domains/usecases/auth.dart';

import 'Registration.dart';

class Login extends StatefulWidget {
  @override
  _UserData createState() => _UserData();
}

class _UserData extends State<Login> {
  late String usernames;
  late String passes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 140)),
            Container(
              child: Center(
                child: Text(
                  'login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.red,
                      letterSpacing: 1.2),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    this.usernames = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              width: 250,
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  setState(() {
                    this.passes = value;
                  });
                },
                autofocus: false,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // ignore: deprecated_member_use
            RaisedButton(
              padding: EdgeInsets.only(left: 50, right: 50),
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                AuthenticationService authenticationService =
                    AuthenticationService(
                  username: '',
                  usermail: usernames,
                  userpassword: passes,
                );
                authenticationService.signIn();
              },
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red),
              ),
              child: Text(
                'Login',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                Container(child: Text('If you do not have mail')),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Registration())),
                  child: Container(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

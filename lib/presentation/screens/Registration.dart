import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/DataLayer/Typeofdata/LocalData.dart';
import 'package:study/domains/usecases/auth.dart';
import 'package:study/presentation/screens/Userinfopage.dart';

class Registration extends StatefulWidget {
  @override
  _UserData createState() => _UserData();
}

class _UserData extends State<Registration> {
  late String username = '', email = '', password = '';

  void initState() {
    super.initState();
    LocalData localData =
        LocalData(name: username, email: email, pass: password);
    localData.SaveData();
  }

  bool isChecked = false;
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
                  'Registration',
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
                  hintText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    this.username = value;
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
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    this.email = value;
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
                    this.password = value;
                  });
                },
                autofocus: false,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  LocalData localData = LocalData(
                    name: username,
                    email: email,
                    pass: password,
                  );
                  localData.LoadData();
                });
              },
            )),
            // ignore: deprecated_member_use
            RaisedButton(
              padding: EdgeInsets.only(left: 50, right: 50),
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {
                AuthenticationService authenticationService =
                    AuthenticationService(
                  usermail: email,
                  userpassword: password,
                  username: username,
                );
                authenticationService.signUp();
                if (authenticationService.signUp() != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => UserInfo()));
                }
              },
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.red),
              ),
              child: Text(
                'Registration',
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

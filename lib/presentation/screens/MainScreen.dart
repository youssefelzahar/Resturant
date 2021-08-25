import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/presentation/screens/Comments.dart';
import 'package:study/presentation/screens/HomeScreen.dart';
import 'package:study/presentation/screens/Login.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  // ignore: non_constant_identifier_names
  int select_indes = 0;
  final pageoption = [HomeScreen(), Comments(), Login()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageoption[select_indes],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: select_indes,
        onTap: (int index) {
          setState(() {
            select_indes = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment,
              size: 30.0,
            ),
            label: 'comments',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
            ),
            label: 'account_circle',
          ),
        ],
      ),
    );
  }
}

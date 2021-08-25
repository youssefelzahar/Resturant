import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

import 'package:study/presentation/widget/Menu.dart';
import 'package:study/presentation/widget/Spicialoffers.dart';

import 'UplodePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.pizzaSlice,
    FontAwesomeIcons.iceCream,
    FontAwesomeIcons.fish,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  late String sname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Uplode()));
        },
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              onChanged: (value) {
                setState(() {
                  this.sname = value;
                });
              },
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildIcon(map.key),
                )
                .toList(),
          ),
          SizedBox(height: 30.0),
          Spicaloffers(),
          SizedBox(height: 30.0),
          Menu(),
        ],
      )),
    );
  }
}

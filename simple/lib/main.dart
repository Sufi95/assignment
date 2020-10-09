 
import 'package:flutter/material.dart';
import "dart:math" as math;

import 'navBar.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: Transform.rotate(
            angle: (show) ? math.pi / -2.0 : math.pi / 2.0,
            child: Icon(Icons.chevron_left)),
        onPressed: () {
          setState(() {
            show = !show;
          });
        },
      ),
      bottomNavigationBar: (show) ? CustomNavBar() : null,
    );
  }
}


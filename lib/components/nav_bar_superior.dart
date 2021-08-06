import 'dart:ui';
import 'package:flutter/material.dart';

class NarBarSuperior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 2.0, color: Colors.black),
        )),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bancolombia AppCB2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.normal)),
            Image.asset(
              'assets/imgs/logo_negro.png',
              width: 50,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class RecaudosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Text('Recaudo Nequi',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}

/*class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: NarBarSuperior(),
        ),
        //GreetingPage(),
        CommerceDataPage(),
        OptionsPage(),
      ],
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/pages/commerce_data.dart';
import 'package:flutter_app/components/pages/movements_page.dart';
import 'package:flutter_app/components/pages/options.dart';
import 'package:flutter_app/components/templates/template_button.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CommerceDataPage(),
        ButtonTemplate(
          textButton: TEXT_LABEL_VIEW_MOVEMENTS,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovementsPage()),
            );
          },
          radious: RADIUS_OPTIONS,
        ),
        OptionsPage(),
      ],
    );
  }
}

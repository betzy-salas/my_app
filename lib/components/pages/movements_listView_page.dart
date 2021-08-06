import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_CircleAvatar.dart';
import 'package:flutter_app/components/atoms/atom_card.dart';
import 'package:flutter_app/components/atoms/atom_listTile.dart';
import 'package:flutter_app/components/atoms/atom_text.dart';
import 'package:flutter_app/components/atoms/atom_text_number.dart';
import 'package:flutter_app/components/constants/constants_color.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/controllers/ListCommerceMovements.dart';
import 'package:flutter_app/components/functions.dart/common_functions.dart';
import 'package:flutter_app/components/templates/template_listView.dart';
import 'package:flutter_app/model.dart/DataMovements.dart';

class MovementsListPage extends StatefulWidget {
  MovementsListPage({Key key}) : super(key: key);

  @override
  _MovementsListPageState createState() => _MovementsListPageState();
}

class _MovementsListPageState extends State<MovementsListPage> {
  ListCommerceMovements getDataCommerce = ListCommerceMovements();

  Future<List<DataMovements>> dataMovements;
  List<DataMovements> listDataMovements = [];

  @override
  void initState() {
    super.initState();
    getDataCommerce.getMovements().then((value) {
      setState(() {
        listDataMovements.addAll(value);
      });
    });
  }

  Widget build(BuildContext context) {
    return ListViewTemplate(
      padding: EdgeInsets.all(0.0),
      radius: 10.0,
      listData: listDataMovements,
      builder: (context, index) {
        CommonFunctions functions = CommonFunctions();
        return CardAtom(
          child: _listTileAtom(index),
          cardProperties: functions.cardProperties(
              true, Clip.antiAliasWithSaveLayer, ELEVATION_CARD, MARGIN_CARD),
          shapeProperties: functions.shapeProperties(RADIUS_OPTIONS),
        );
      },
    );
  }

  ListTileAtom _listTileAtom(index) {
    return ListTileAtom(
      leading: _buildLeading(index),
      title: _buildTitle(index),
      subtitle: _buildSubtitle(index),
      trailing: _buildTrailing(index),
    );
  }

  CircleAvatarAtom _buildLeading(index) {
    return CircleAvatarAtom(
        backgroundColor: _getColor(listDataMovements[index]
            .transactionState
            .substring(0, 2)
            .toUpperCase()),
        child: SimpleTextAtom(
            align: TextAlign.center,
            text: listDataMovements[index].transactionState.substring(0, 2),
            size: SIZE_SIMPLE_TEXT,
            weight: FontWeight.bold,
            family: TEXT_FONT_FAMILY,
            style: FontStyle.normal,
            colors: colorSimpleTextBlack));
  }

  SimpleTextAtom _buildTitle(index) {
    return SimpleTextAtom(
        align: TextAlign.left,
        text: listDataMovements[index].transactionDescription,
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.bold,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack);
  }

  SimpleTextAtom _buildSubtitle(index) {
    return SimpleTextAtom(
        align: TextAlign.left,
        text: listDataMovements[index].transactionDate.toString(),
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.normal,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack);
  }

  SimpleTextNumberAtom _buildTrailing(index) {
    return SimpleTextNumberAtom(
        align: TextAlign.center,
        text: listDataMovements[index].transactionValue,
        size: SIZE_SIMPLE_TEXT,
        weight: FontWeight.bold,
        family: TEXT_FONT_FAMILY,
        style: FontStyle.normal,
        colors: colorSimpleTextBlack);
  }

  Color _getColor(String transationState) {
    print(transationState);
    switch (transationState) {
      case 'AC':
        return Colors.greenAccent;
        break;
      case 'DE':
        return Colors.redAccent;
        break;
      case 'RE':
        return Colors.yellowAccent;
        break;
      case 'AN':
        return Colors.purpleAccent;
        break;
    }
    return Colors.black;
  }
}

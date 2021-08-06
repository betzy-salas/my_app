import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_container.dart';
import 'package:flutter_app/components/atoms/atom_text.dart';
import 'package:flutter_app/components/atoms/atom_text_number.dart';
import 'package:flutter_app/components/constants/constants_color.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/controllers/GetDataCommerce.dart';
import 'package:flutter_app/components/functions.dart/common_functions.dart';
import 'package:flutter_app/components/molecules/molecule_ContainerRow.dart';
import 'package:flutter_app/components/molecules/molecule_centerCircularProgressIndicator.dart';
import 'package:flutter_app/components/templates/template_commerce_data.dart';
import 'package:flutter_app/model.dart/DataCommerce.dart';

class NequiResponsePage extends StatefulWidget {
  NequiResponsePage({Key key}) : super(key: key);

  @override
  _NequiResponsePageState createState() => _NequiResponsePageState();
}

class _NequiResponsePageState extends State<NequiResponsePage> {
  GetDataCommerce getDataCommerce = GetDataCommerce();
  Future<DataCommerce> dataCommerce;

  @override
  void initState() {
    super.initState();
    dataCommerce = getDataCommerce.getDataCommerce();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dataCommerce,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _cardDataCommerce(snapshot.data);
        } else if (snapshot.hasError) {
          return SimpleTextAtom(
              align: TextAlign.center,
              text: TEXT_ERROR_DATA_COMMERCE,
              size: 20.0,
              weight: FontWeight.bold,
              family: 'Raleway',
              style: FontStyle.normal,
              colors: colorSimpleTextRed);
        }
        return CircularProgressMolecule();
      },
    );
  }

  Container _cardDataCommerce(DataCommerce dataCommerce) {
    return Container(
      height: 200,
      width: 500,
      child: _buildCard(dataCommerce),
    );
  }

  CommerceBuildDataTemplate _buildCard(DataCommerce dataCommerce) {
    CommonFunctions functions = CommonFunctions();
    return CommerceBuildDataTemplate(
      cardProperties: functions.cardProperties(
          true, Clip.antiAliasWithSaveLayer, ELEVATION_CARD, MARGIN_CARD),
      columnProperties: functions.columnProperties(
          CrossAxisAlignment.start, MainAxisSize.min),
      shapeProperties: functions.shapeProperties(RADIUS_OPTIONS),
      listChildren: _listChildren(
          dataCommerce.getCommerceName,
          dataCommerce.getCodeCommerce,
          dataCommerce.codeCommerceChild,
          dataCommerce.getCommerceBalance),
    );
  }

  List<Widget> _listChildren(String commerceName, int codeCommerce,
      int codeCommerceChild, double commerceBalance) {
    List<Widget> listChildren = [];

    listChildren.add(_mainMessage(commerceName));
    listChildren.add(SizedBox(height: SIZE_BOX));
    listChildren.add(_textDataCommerce());
    listChildren.add(_mainDataCommerce(
        codeCommerce.toString(), codeCommerceChild.toString()));
    listChildren.add(SizedBox(height: SIZE_BOX));
    listChildren.add(ContainerAtom(
        alignment: Alignment.topLeft,
        child: SimpleTextAtom(
            align: TextAlign.right,
            text: TEXT_LABEL_BALANCE,
            size: SIZE_SIMPLE_TEXT,
            weight: FontWeight.bold,
            family: TEXT_FONT_FAMILY,
            style: FontStyle.normal,
            colors: colorSimpleTextBlack)));
    listChildren.add(_textDataBalancer(commerceBalance));

    return listChildren;
  }

  String _showMessage(String commerceName) {
    return "! Hola " + commerceName + "!";
  }

  ContainerRowMolecule _mainMessage(String commerceName) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SimpleTextAtom(
              align: TextAlign.right,
              text: _showMessage(commerceName),
              size: SIZE_BOLD_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
        ]);
  }

  ContainerRowMolecule _mainDataCommerce(
      String codeCommerce, String commerceChild) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SimpleTextAtom(
              align: TextAlign.center,
              text: codeCommerce,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
          SimpleTextAtom(
              align: TextAlign.center,
              text: commerceChild,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack)
        ]);
  }

  ContainerRowMolecule _textDataCommerce() {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SimpleTextAtom(
              align: TextAlign.center,
              text: TEXT_COMMERCE_NAME,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.normal,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
          SimpleTextAtom(
              align: TextAlign.center,
              text: TEXT_COMMERCE_CHILD_NAME,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.normal,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack)
        ]);
  }

  ContainerRowMolecule _textDataBalancer(double dataCommerceBalance) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SimpleTextNumberAtom(
              align: TextAlign.right,
              text: dataCommerceBalance,
              size: SIZE_BOLD_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
        ]);
  }
}

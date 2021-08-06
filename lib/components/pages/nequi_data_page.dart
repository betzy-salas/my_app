import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_text.dart';
import 'package:flutter_app/components/atoms/atom_text_number.dart';
import 'package:flutter_app/components/constants/constants_color.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/controllers/NequiHelper.dart';
import 'package:flutter_app/components/functions.dart/common_functions.dart';
import 'package:flutter_app/components/molecules/molecule_ContainerRow.dart';
import 'package:flutter_app/components/molecules/molecule_centerCircularProgressIndicator.dart';
import 'package:flutter_app/components/objects/DataResponse.dart';
import 'package:flutter_app/components/templates/template_commerce_balance.dart';
import 'package:flutter_app/model.dart/DataCommerce.dart';

class NequiDataPage extends StatefulWidget {
  NequiDataPage(
      {Key key,
      this.codeCommerce,
      this.codeCommerceChild,
      this.transactionValue,
      this.numberProduct})
      : super(key: key);

  final codeCommerce;
  final codeCommerceChild;
  final transactionValue;
  final numberProduct;

  @override
  _NequiDataPagePageState createState() => _NequiDataPagePageState();
}

class _NequiDataPagePageState extends State<NequiDataPage> {
  NequiHelper nequiTransaction = NequiHelper();
  Future responseNequi;

  @override
  void initState() {
    CommonFunctions functions = CommonFunctions();
    super.initState();
    responseNequi = nequiTransaction.addMovements(
        widget.codeCommerce,
        widget.codeCommerceChild,
        functions.setTransactionCode(TRANSACTION_CODE_NEQUI),
        widget.transactionValue,
        widget.numberProduct,
        functions.setTransactiondescription(TEXT_TRANSACTION_DESCRIPTION_NEQUI),
        functions.setproductType(TEXT_PRODUCT_TYPE_NEQUI),
        functions.setCaptureMode("OnLine"),
        functions.setReferenceOne(""),
        functions.setReferenceTwo(""),
        functions.setReferenceThree(""),
        functions.setTransactionalType(TEXT_TRANSACTIONAL_TYPE_NEQUI));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: responseNequi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _cardDataCommerce(snapshot.data);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return CircularProgressMolecule();
      },
    );
  }

  Container _cardDataCommerce(DataResponse dataResponse) {
    /*return Container(
      height: 100,
      width: 550,
      child: _cardDataBalanceCommerce(dataCommerce),
    );*/
    return Container(
      height: 100,
      width: 550,
      child: Text(dataResponse.messageError),
    );
  }

  Container _cardDataBalanceCommerce(DataCommerce dataCommerce) {
    return Container(
      height: 200,
      width: 500,
      child: _buildCard(dataCommerce),
    );
  }

  CommerceBuildBalanceTemplate _buildCard(DataCommerce dataCommerce) {
    CommonFunctions functions = CommonFunctions();
    return CommerceBuildBalanceTemplate(
      cardProperties: functions.cardProperties(
          true, Clip.antiAliasWithSaveLayer, ELEVATION_CARD, MARGIN_CARD),
      columnProperties: functions.columnProperties(
          CrossAxisAlignment.start, MainAxisSize.min),
      shapeProperties: functions.shapeProperties(RADIUS_OPTIONS),
      children: _listChildren(dataCommerce.getCodeCommerce,
          dataCommerce.getCodeCommerceChild, dataCommerce.getCommerceBalance),
    );
  }

  List<Widget> _listChildren(
      int codeCommerce, int codeCommerceChild, double commerceBalance) {
    List<Widget> listChildren = [];
    listChildren.add(SizedBox(height: SIZE_BOX));
    listChildren.add(_textDataCommerce());
    listChildren.add(_mainDataBalanceCommerce(
        codeCommerce, codeCommerceChild, commerceBalance));

    return listChildren;
  }

  ContainerRowMolecule _mainDataBalanceCommerce(
      int codeCommerce, int codeCommerceChild, double commerceBalance) {
    return ContainerRowMolecule(
        alignment: Alignment.topRight,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SimpleTextAtom(
              align: TextAlign.center,
              text: codeCommerce.toString(),
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
          SimpleTextAtom(
              align: TextAlign.center,
              text: codeCommerceChild.toString(),
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
          SimpleTextNumberAtom(
              align: TextAlign.right,
              text: commerceBalance,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.bold,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack),
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
              colors: colorSimpleTextBlack),
          SimpleTextAtom(
              align: TextAlign.center,
              text: TEXT_LABEL_BALANCE,
              size: SIZE_SIMPLE_TEXT,
              weight: FontWeight.normal,
              family: TEXT_FONT_FAMILY,
              style: FontStyle.normal,
              colors: colorSimpleTextBlack)
        ]);
  }
}

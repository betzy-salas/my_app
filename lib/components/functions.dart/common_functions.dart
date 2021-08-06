import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/objects/CardPropertiesPage.dart';
import 'package:flutter_app/components/objects/ColumPropertiesPage.dart';
import 'package:flutter_app/components/objects/TextFormFieldProperties.dart';

class CommonFunctions {
  CardPropertiesPage cardProperties(
      bool semanticContainer, Clip clip, double elevation, double margin) {
    CardPropertiesPage cardColumPageModel = new CardPropertiesPage(
        semanticContainer, clip, elevation, EdgeInsets.all(margin));

    return cardColumPageModel;
  }

  ColumnPropertiesPage columnProperties(
      CrossAxisAlignment crossAxisAlignment, MainAxisSize mainAxisSize) {
    ColumnPropertiesPage columnPropertiesPage =
        new ColumnPropertiesPage(crossAxisAlignment, mainAxisSize);

    return columnPropertiesPage;
  }

  RoundedRectangleBorder shapeProperties(double radious) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radious),
    );
  }

  TextFormFieldProperties textFormFieldProperties(
      TextEditingController controller,
      InputDecoration decoration,
      Function validator,
      TextInputType keyboardType,
      bool obscureText,
      List<TextInputFormatter> inputFormatter) {
    return TextFormFieldProperties(controller, decoration, validator,
        keyboardType, obscureText, inputFormatter);
  }

  InputDecoration inputDecoration(
      String hintText, String labelText, String errorText) {
    return InputDecoration(
        hintText: hintText, labelText: labelText, errorText: errorText);
  }

  String setCaptureMode(String captureMode) {
    return captureMode;
  }

  int setTransactionCode(int transactionCode) {
    return transactionCode;
  }

  String setTransactiondescription(String transactionDescription) {
    return transactionDescription;
  }

  String setproductType(String productType) {
    return productType;
  }

  String setReferenceOne(String referenceOne) {
    return referenceOne;
  }

  String setReferenceTwo(String referenceTwo) {
    return referenceTwo;
  }

  String setReferenceThree(String referenceThree) {
    return referenceThree;
  }

  String setTransactionalType(String transactionalType) {
    return transactionalType;
  }
}

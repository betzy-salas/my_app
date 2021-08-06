import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/molecules/molecule_ContainerRow.dart';
import 'package:flutter_app/components/molecules/molecule_containerTextFormField.dart';
import 'package:flutter_app/components/objects/TextFormFieldProperties.dart';
import 'package:flutter_app/components/pages/home.dart';
import 'package:flutter_app/components/pages/nequi_response_page.dart';
import 'package:flutter_app/components/templates/template_button.dart';

class NequiPage extends StatefulWidget {
  final codeCommerce;
  final codeCommerceChild;

  NequiPage({this.codeCommerce, this.codeCommerceChild});

  @override
  _NequiPageState createState() => _NequiPageState();
}

class _NequiPageState extends State<NequiPage> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  final TextEditingController numberProductController = TextEditingController();
  final TextEditingController transactionValueController =
      TextEditingController();
  final TextEditingController pinGeneratedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*body: FormListViewOrganism(
        key: keyForm,
        padding: EdgeInsets.all(20.0),
        children: _listChildren(),
      ),*/
      body: Form(
        key: keyForm,
        child: ListView(
            padding: EdgeInsets.all(20.0),
            children:
                _listChildren(widget.codeCommerce, widget.codeCommerceChild)),
      ),
    );
  }

  List<Widget> _listChildren(int codeCommerce, int codeCommerceChild) {
    List<Widget> _listChildren = [];

    _listChildren.add(ContainerTextFormFieldMolecule(
      height: HEIGHT_CONTAINER,
      propertiesTextFormField: new TextFormFieldProperties(
          numberProductController,
          InputDecoration(
              hintText: TEXT_FORM_ACCOUNT_NUMBER_NEQUI,
              labelText: TEXT_FORM_ACCOUNT_NUMBER_NEQUI,
              icon: new Icon(Icons.account_balance_wallet_rounded)),
          _validateAccountNumber,
          TextInputType.number,
          false,
          <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]),
    ));
    _listChildren.add(ContainerTextFormFieldMolecule(
      height: HEIGHT_CONTAINER,
      propertiesTextFormField: new TextFormFieldProperties(
          transactionValueController,
          InputDecoration(
              hintText: TEXT_FORM_VALUE_NEQUI,
              labelText: TEXT_FORM_VALUE_NEQUI,
              icon: new Icon(Icons.account_balance_wallet_rounded)),
          _validateTransactionValue,
          TextInputType.numberWithOptions(decimal: true),
          false,
          <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]"))
          ]
          /*<TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ]*/
          ),
    ));
    _listChildren.add(ContainerTextFormFieldMolecule(
      height: HEIGHT_CONTAINER,
      propertiesTextFormField: new TextFormFieldProperties(
          pinGeneratedController,
          InputDecoration(
              hintText: TEXT_FORM_PIN_NEQUI,
              labelText: TEXT_FORM_PIN_NEQUI,
              icon: new Icon(Icons.account_balance_wallet_rounded)),
          _validatePin,
          TextInputType.number,
          true,
          <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]),
    ));
    _listChildren.add(
      ContainerRowMolecule(
          alignment: null,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _listRowChildren(codeCommerce, codeCommerceChild)),
    );

    return _listChildren;
  }

  List<Widget> _listRowChildren(int codeCommerce, int codeCommerceChild) {
    List<Widget> _listRowChildren = [];
    _listRowChildren.add(ButtonTemplate(
      textButton: TEXT_LABEL_BUTTON_ACEPTAR,
      onPressed: () {
        _save(codeCommerce, codeCommerceChild);
      },
      radious: RADIUS_OPTIONS,
    ));
    _listRowChildren.add(ButtonTemplate(
      textButton: TEXT_LABEL_BUTTON_CANCELAR,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      radious: RADIUS_OPTIONS,
    ));

    return _listRowChildren;
  }

  String _validateAccountNumber(String value) {
    if (_isEmpty(value))
      return "El Número de cuenta Nequi debe ser ingresada";
    else if (_isLengthComplete(value, LENGTH_ACCOUNT)) {
      return "El longitud del Número de cuenta Nequi debe ser " +
          LENGTH_ACCOUNT.toString();
    }

    return null;
  }

  String _validateTransactionValue(String value) {
    final n = num.tryParse(value);
    if (_isEmpty(value))
      return "El valor a retirar debe ser ingresado";
    else if (n == null)
      return "El Valor del Retiro ${value} no es valor válido";
    else if (n > AMOUNT_MAX_NEQUI)
      return "El Valor del Retiro supera tope permitido";

    return null;
  }

  String _validatePin(String value) {
    if (_isEmpty(value))
      return "El pin debe ser ingresado";
    else if (_isLengthComplete(value, LENGTH_PIN)) {
      return "El longitud del pin debe ser " + LENGTH_PIN.toString();
    }

    return null;
  }

  bool _isEmpty(String value) {
    return (value.isEmpty || value.length == 0);
  }

  bool _isLengthComplete(String value, int length) {
    return (value.length != length);
  }

  _save(int codeCommerce, int codeCommerceChild) {
    if (keyForm.currentState.validate()) {
      /*serviceHelper.addMovements(
          codeCommerce,
          codeCommerceChild,
          TRANSACTION_CODE_NEQUI,
          int.parse(transactionValueController.text),
          numberProductController.text,
          TEXT_TRANSACTION_DESCRIPTION_NEQUI,
          TEXT_PRODUCT_TYPE_NEQUI);*/
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NequiResponsePage(
                  codeCommerce: codeCommerce,
                  codeCommerceChild: codeCommerceChild,
                  transactionValue: int.parse(transactionValueController.text),
                  numberProduct: numberProductController.text,
                )),
      );
    }
  }

  _reset() {
    keyForm.currentState.reset();
  }
}

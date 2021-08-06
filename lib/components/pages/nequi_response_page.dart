import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_bottomNavigatorBar.dart';
import 'package:flutter_app/components/atoms/atom_column_empty.dart';
import 'package:flutter_app/components/atoms/atom_expanded.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/pages/appBar_page.dart';
import 'package:flutter_app/components/pages/home.dart';
import 'package:flutter_app/components/pages/movements_data_page.dart';
import 'package:flutter_app/components/pages/movements_listView_page.dart';
import 'package:flutter_app/components/pages/nequi_data_page.dart';
import 'package:flutter_app/components/templates/template_button.dart';

class NequiResponsePage extends StatefulWidget {
  NequiResponsePage(
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
  _NequiResponsePageState createState() => _NequiResponsePageState();
}

class _NequiResponsePageState extends State<NequiResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: AppBarPage(),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: _buildBody(),
      //bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return ColumnEmptyAtom(children: <Widget>[
      NequiDataPage(
        codeCommerce: widget.codeCommerce,
        codeCommerceChild: widget.codeCommerceChild,
        transactionValue: widget.transactionValue,
        numberProduct: widget.numberProduct,
      ),
      ButtonTemplate(
        textButton: TEXT_LABEL_VIEW_HOME,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        radious: RADIUS_OPTIONS,
      ),
      //ExpandedAtom(child: MovementsListPage()),
    ]);
  }
}

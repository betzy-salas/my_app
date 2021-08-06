import 'package:flutter/material.dart';
import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/pages/appBar_page.dart';
import 'package:flutter_app/components/pages/main_page.dart';
import 'package:flutter_app/components/pages/nequi_page.dart';
import 'package:flutter_app/components/pages/nequi_response_page.dart';
import 'package:flutter_app/components/pages/perfil_page.dart';
import 'package:flutter_app/components/pages/recaudos_page.dart';
import 'package:flutter_app/components/pages/retiro_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LayoutType _layoutSelection1 = LayoutType.inicio;
  LayoutType get _layoutSelection => _layoutSelection1;

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection1 = selection;
    });
  }

  void _onSelectTab(int index) {
    _onLayoutSelected(LayoutType.values[index]);
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection1 == layoutSelection ? Colors.yellow : Colors.black;
  }

  BottomNavigationBarItem _buildItem(
      {IconData icon, LayoutType layoutSelection}) {
    String text = layoutNames[layoutSelection];
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _colorTabMatching(layoutSelection: layoutSelection),
        ),
        label: text);
  }

  Widget _buildBody() {
    return <LayoutType, WidgetBuilder>{
      LayoutType.inicio: (_) => MainPage(),
      LayoutType.nequi: (_) => NequiPage(
            codeCommerce: CODE_COMMERCE,
            codeCommerceChild: CODE_COMMERCE_CHILD,
          ),
      LayoutType.recaudos: (_) => RecaudosPage(),
      LayoutType.retiro: (_) => RetiroPage(),
      LayoutType.perfil: (_) => PerfilPage(),
      LayoutType.nequi_response: (_) => NequiResponsePage(),
    }[_layoutSelection](context);

    //return MainPage();
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(icon: Icons.home, layoutSelection: LayoutType.inicio),
        _buildItem(icon: Icons.format_size, layoutSelection: LayoutType.nequi),
        _buildItem(icon: Icons.layers, layoutSelection: LayoutType.recaudos),
        _buildItem(icon: Icons.line_weight, layoutSelection: LayoutType.retiro),
        _buildItem(
            icon: Icons.account_circle, layoutSelection: LayoutType.perfil),
      ],
      onTap: _onSelectTab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _getLeadingObjetc(), // BackButton(color: Colors.black),
        automaticallyImplyLeading: _getLeading(),
        title: AppBarPage(),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  bool _getLeading() {
    if (_layoutSelection1 != LayoutType.inicio)
      /*return BackButton(
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      );*/
      return true;
    else
      return false;
  }

  Widget _getLeadingObjetc() {
    if (_layoutSelection1 != LayoutType.inicio)
      return BackButton(
        color: Colors.black,
        /*onPressed: () {
          Navigator.of(context).pop();
        },*/
      );
    else
      return null;
  }
}

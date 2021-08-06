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
  int _currentIndex = 0;
  LayoutType _layoutSelection1 = LayoutType.inicio;

  void _onSelectTab(int index) {
    List<Widget> _listPages = [
      MainPage(),
      NequiPage(),
      RecaudosPage(),
      RetiroPage(),
      PerfilPage()
    ];
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _listPages[index]),
    );
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection1 == layoutSelection ? Colors.yellow : Colors.black;
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: BackButton(color: Colors.black),
        title: AppBarPage(),
        backgroundColor: Colors.white,
      ),
      body: //_buildBody(),
          MainPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

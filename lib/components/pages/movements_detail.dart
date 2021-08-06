import 'package:flutter/material.dart';
import 'package:flutter_app/components/atoms/atom_bottomNavigatorBar.dart';
import 'package:flutter_app/components/atoms/atom_column_empty.dart';
import 'package:flutter_app/components/atoms/atom_expanded.dart';
import 'package:flutter_app/components/atoms/atom_safeArea.dart';
import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/components/constants/constants_number.dart';
import 'package:flutter_app/components/constants/constants_text.dart';
import 'package:flutter_app/components/nav_bar_superior.dart';
import 'package:flutter_app/components/pages/main_page.dart';
import 'package:flutter_app/components/pages/movements_data_page.dart';
import 'package:flutter_app/components/pages/movements_listView_page.dart';
import 'package:flutter_app/components/pages/nequi_page.dart';
import 'package:flutter_app/components/pages/perfil_page.dart';
import 'package:flutter_app/components/pages/recaudos_page.dart';
import 'package:flutter_app/components/pages/retiro_page.dart';
import 'package:flutter_app/components/templates/template_button.dart';

class MovementsDetailPage extends StatefulWidget {
  MovementsDetailPage({Key key}) : super(key: key);

  @override
  _MovementsDetailPageState createState() => _MovementsDetailPageState();
}

class _MovementsDetailPageState extends State<MovementsDetailPage> {
  LayoutType _typePage = LayoutType.movements;
  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
  LayoutType _layoutSelection1 = LayoutType.inicio;
  LayoutType _layoutSelection2 = LayoutType.nequi;
  LayoutType get _layoutSelection => _layoutGroup == LayoutGroup.nonScrollable
      ? _layoutSelection1
      : _layoutSelection2;

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _typePage = selection;
      if (_layoutGroup == LayoutGroup.nonScrollable) {
        _layoutSelection1 = selection;
      } else {
        _layoutSelection2 = selection;
      }
    });
  }

  void _onSelectTab(int index) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      _onLayoutSelected(LayoutType.values[index]);
    } else {
      _onLayoutSelected(LayoutType.values[index + 5]);
    }
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    if (_layoutGroup == LayoutGroup.nonScrollable) {
      return _layoutSelection1 == layoutSelection
          ? Colors.yellow
          : Colors.black;
    } else {
      return _layoutSelection2 == layoutSelection
          ? Colors.yellow
          : Colors.black;
    }
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

  BottomNavigatorBarAtom _buildBottomNavigationBar() {
    return BottomNavigatorBarAtom(
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
      backgroundColor: Colors.white,
      body: _buildBody(_typePage),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(final typePage) {
    if (typePage != LayoutType.movements) {
      return <LayoutType, WidgetBuilder>{
        LayoutType.inicio: (_) => MainPage(),
        LayoutType.nequi: (_) => NequiPage(),
        LayoutType.recaudos: (_) => RecaudosPage(),
        LayoutType.retiro: (_) => RetiroPage(),
        LayoutType.perfil: (_) => PerfilPage(),
      }[_layoutSelection](context);
    } else {
      return ColumnEmptyAtom(children: <Widget>[
        SafeAreaAtom(
          child: NarBarSuperior(),
        ),
        MovementsDataPage(),
        ButtonTemplate(
          textButton: TEXT_LABEL_VIEW_HOME,
          onPressed: () {
            Navigator.pop(context);
          },
          radious: RADIUS_OPTIONS,
        ),
        ExpandedAtom(child: MovementsListPage()),
      ]);
    }
  }
}

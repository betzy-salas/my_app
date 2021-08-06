import 'package:flutter/material.dart';
import 'package:flutter_app/components/pages/main_page.dart';
import 'package:flutter_app/components/pages/nequi_page.dart';
import 'package:flutter_app/components/pages/perfil_page.dart';
import 'package:flutter_app/components/pages/recaudos_page.dart';
import 'package:flutter_app/components/pages/retiro_page.dart';

enum LayoutOptionMenu { nequi, giros, pagos, consignaciones, recaudos, tarjeta }

Map<LayoutOptionMenu, String> layoutOptionsMenu = {
  LayoutOptionMenu.nequi: 'Nequi',
  LayoutOptionMenu.giros: 'Giros',
  LayoutOptionMenu.pagos: 'Pagos',
  LayoutOptionMenu.consignaciones: 'Consignaciones',
  LayoutOptionMenu.recaudos: 'Recaudos',
  LayoutOptionMenu.tarjeta: 'Trx. con Tarjeta'
};

Map<LayoutOptionMenu, IconData> iconData = {
  LayoutOptionMenu.nequi: Icons.access_alarm,
  LayoutOptionMenu.giros: Icons.access_alarm,
  LayoutOptionMenu.pagos: Icons.access_alarm,
  LayoutOptionMenu.consignaciones: Icons.access_alarm,
  LayoutOptionMenu.recaudos: Icons.access_alarm,
  LayoutOptionMenu.tarjeta: Icons.access_alarm
};

enum Resource {
  dataclient,
  datacomerce,
  datatransactionalmovements,
  addMovements
}

Map<Resource, String> resourcesUrl = {
  Resource.dataclient:
      'https://wlsxk2z053.execute-api.us-east-2.amazonaws.com/dataclient',
  Resource.datacomerce:
      'https://i3hz84g9p9.execute-api.us-east-2.amazonaws.com/datacomerce',
  Resource.datatransactionalmovements:
      'https://3exnmbr65j.execute-api.us-east-2.amazonaws.com/datatransactionalmovements',
  Resource.addMovements:
      'https://s9ix99x043.execute-api.us-east-2.amazonaws.com/prodFunction'
};

String getResourceUrl(Resource resource, String params) {
  if (params.isEmpty || params.length == 0) {
    return resourcesUrl[resource];
  } else {
    return resourcesUrl[resource] + '?' + params;
  }
}

enum LayoutGroup {
  nonScrollable,
  scrollable,
}

abstract class HasLayoutGroup {
  LayoutGroup get layoutGroup;
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  inicio,
  nequi,
  recaudos,
  retiro,
  perfil,
  movements,
  nequi_response
}

Map<LayoutType, String> layoutNames = {
  LayoutType.inicio: 'Inicio',
  LayoutType.nequi: 'Nequi',
  LayoutType.recaudos: 'Recaudos',
  LayoutType.retiro: 'Retiro ALM',
  LayoutType.perfil: 'Perfil',
  LayoutType.movements: 'Movements',
  LayoutType.nequi_response: 'Nequi Response'
};

List<Widget> _listPages = [
  MainPage(),
  NequiPage(),
  RecaudosPage(),
  RetiroPage(),
  PerfilPage()
];

Widget getListPages(int index) {
  return _listPages[index];
}

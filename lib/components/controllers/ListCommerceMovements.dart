import 'dart:convert';

import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/model.dart/AdditionalInformation.dart';
import 'package:flutter_app/model.dart/DataMovements.dart';
import 'package:http/http.dart' as http;

class ListCommerceMovements {
  Future<List<DataMovements>> dataMovements;
  List<DataMovements> listDataMovements = [];

  Future<List<DataMovements>> getMovements() async {
    String _url = getResourceUrl(Resource.datatransactionalmovements,
        'CodeCommerce=45687&CodeCommerceChild=67856');
    List<DataMovements> dataMovements = [];
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData["dataTransactionalMovementList"]) {
        AdditionalInformation additionalInformation =
            new AdditionalInformation.fromJson(item["AdditionalInformation"]);
        dataMovements.add(DataMovements(
            item["ApprovalCodeTransaction"],
            item["CodeCommerce"],
            item["CodeCommerceChild"],
            item["TransactionCode"],
            item["TransactionDate"],
            item["TransactionHour"],
            item["TransactionValue"],
            item["UniqueCodeTransaction"].toString(),
            item["NumberProduct"],
            item["ProductType"],
            item["TransactionDescription"],
            item["TransactionState"],
            additionalInformation));
      }
    } else {
      throw Exception("Falló la conexión");
    }
    return dataMovements;
  }
}

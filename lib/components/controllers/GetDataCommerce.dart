import 'dart:convert';
import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/model.dart/DataCommerce.dart';
import 'package:http/http.dart' as http;

class GetDataCommerce {
  Future<DataCommerce> dataCommerce;

  Future<DataCommerce> getDataCommerce() async {
    String _url = getResourceUrl(
        Resource.datacomerce, 'CodeCommerce=45687&CodeCommerceChild=67856');
    DataCommerce dataCommerce;
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);
      for (var item in jsonData["dataCommerceList"]) {
        dataCommerce = DataCommerce(
            item["CodeCommerce"],
            item["CodeCommerceChild"],
            item["CommerceBalance"],
            item["CommerceName"]);
      }
    } else {
      throw Exception("Falló la conexión");
    }
    return dataCommerce;
  }
}

import 'package:flutter_app/components/constants/constants_maps.dart';
import 'package:flutter_app/components/objects/DataResponse.dart';
import 'package:flutter_app/model.dart/AdditionalInformation.dart';
import 'package:flutter_app/model.dart/DataMovements.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class NequiHelper {
  Response responseServer;
  DataResponse dataResponse;

  Future<DataResponse> addMovements(
      int codeCommerce,
      int codeCommerceChild,
      int transactionCode,
      int transactionValue,
      String numberProduct,
      String transactionDescription,
      String productType,
      String captureMode,
      String referenceOne,
      String referenceTwo,
      String referenceThree,
      String transactionalType) async {
    String body = getDataMovements(
        codeCommerce,
        codeCommerceChild,
        transactionCode,
        transactionValue,
        numberProduct,
        transactionDescription,
        productType,
        captureMode,
        referenceOne,
        referenceTwo,
        referenceThree,
        transactionalType);

    responseServer = await http.post(getResourceUrl(Resource.addMovements, ""),
        headers: {"Content-Type": "application/json"}, body: body);

    if (responseServer.statusCode == 200) {
      Map<String, dynamic> jsonData = new Map<String, dynamic>.from(
          json.decode(utf8.decode(responseServer.bodyBytes)));
      var valueMap = jsonDecode(jsonData['body']).values.toList();
      for (var item in valueMap) {
        dataResponse = DataResponse(
            item[0]["MessageCode"], item[0]["Message"], item[0]["Body"]);
      }
    } else {
      throw Exception("Falló la conexión");
    }
    return dataResponse;
  }

  String getDataMovements(
      int codeCommerce,
      int codeCommerceChild,
      int transactionCode,
      int transactionValue,
      String numberProduct,
      String transactionDescription,
      String productType,
      String captureMode,
      String referenceOne,
      String referenceTwo,
      String referenceThree,
      String transactionalType) {
    int approvalCodeTransaction;
    int transactionDate;
    int transactionHour;
    String uniqueCodeTransaction;
    String transactionState;
    AdditionalInformation additionalInformation;

    //print("${DateTime.now().year}");
    //print("${DateTime.now().month}");
    //print("${DateTime.now().day}");

    Random random = new Random();
    var newFormat = DateFormat("yyyyMMdd");
    var newFormatHour = DateFormat("HHmmss");
    approvalCodeTransaction = random.nextInt(999999);
    transactionDate = int.parse(newFormat.format(DateTime.now()));
    transactionHour = int.parse(newFormatHour.format(DateTime.now()));
    uniqueCodeTransaction = transactionDate.toString() +
        transactionHour.toString() +
        approvalCodeTransaction.toString();
    transactionState = "Pendiente";

    additionalInformation = new AdditionalInformation(
        captureMode: captureMode,
        referenceOne: referenceOne,
        referenceTwo: referenceTwo,
        referenceThree: referenceThree,
        transactionalType: transactionalType);

    DataMovements dataMovements = new DataMovements(
        approvalCodeTransaction,
        codeCommerce,
        codeCommerceChild,
        transactionCode,
        transactionDate,
        transactionHour,
        transactionValue,
        uniqueCodeTransaction,
        numberProduct,
        productType,
        transactionDescription,
        transactionState,
        additionalInformation);

    String body = jsonEncode(dataMovements);
    return body;
  }
}

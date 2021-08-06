import 'package:flutter_app/model.dart/AdditionalInformation.dart';

class DataMovements {
  int approvalCodeTransaction;
  int codeCommerce;
  int codeCommerceChild;
  int transactionCode;
  int transactionDate;
  int transactionHour;
  int transactionValue;
  String uniqueCodeTransaction;
  String numberProduct;
  String productType;
  String transactionDescription;
  String transactionState;
  AdditionalInformation additionalInformation;

  DataMovements(
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
      additionalInformation) {
    this.uniqueCodeTransaction = uniqueCodeTransaction;
    this.approvalCodeTransaction = approvalCodeTransaction;
    this.codeCommerce = codeCommerce;
    this.codeCommerceChild = codeCommerceChild;
    this.transactionCode = transactionCode;
    this.transactionDate = transactionDate;
    this.transactionHour = transactionHour;
    this.transactionValue = transactionValue;
    this.numberProduct = numberProduct;
    this.productType = productType;
    this.transactionDescription = transactionDescription;
    this.transactionState = transactionState;
    this.additionalInformation = additionalInformation;
  }

  Map toJson() {
    Map additionalInformation = this.additionalInformation != null
        ? this.additionalInformation.toJson()
        : null;

    return {
      'UniqueCodeTransaction': uniqueCodeTransaction,
      'ApprovalCodeTransaction': approvalCodeTransaction,
      'CodeCommerce': codeCommerce,
      'CodeCommerceChild': codeCommerceChild,
      'TransactionCode': transactionCode,
      'TransactionDate': transactionDate,
      'TransactionHour': transactionHour,
      'TransactionValue': transactionValue,
      'NumberProduct': numberProduct,
      'ProductType': productType,
      'TransactionDescription': transactionDescription,
      'TransactionState': transactionState,
      'AdditionalInformation': additionalInformation
    };
  }
}

class DataResponse {
  String codError;
  String messageError;
  String bodyTransaction;

  DataResponse(codError, messageError, bodyTransaction) {
    this.codError = codError;
    this.messageError = messageError;
    this.bodyTransaction = bodyTransaction;
  }
}

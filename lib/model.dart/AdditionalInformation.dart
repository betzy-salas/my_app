class AdditionalInformation {
  String captureMode;
  String referenceOne;
  String referenceTwo;
  String referenceThree;
  String transactionalType;

  /*AdditionalInformational(captureMode, referenceOne, referenceTwo,
      referenceThree, transactionalType) {

  }*/

  AdditionalInformation(
      {this.captureMode,
      this.referenceOne,
      this.referenceTwo,
      this.referenceThree,
      this.transactionalType});

  factory AdditionalInformation.fromJson(Map<String, dynamic> json) {
    return AdditionalInformation(
        captureMode: json["CaptureMode"].toString(),
        referenceOne: json["ReferenceOne"].toString(),
        referenceTwo: json["ReferenceTwo"].toString(),
        referenceThree: json["ReferenceThree"].toString(),
        transactionalType: json["TransactionType"].toString());
  }

  Map toJson() => {
        'CaptureMode': captureMode,
        'ReferenceOne': referenceOne,
        'ReferenceTwo': referenceTwo,
        'ReferenceThree': referenceThree,
        'TransactionType': transactionalType
      };
}

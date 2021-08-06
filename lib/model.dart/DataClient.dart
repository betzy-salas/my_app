class DataClient {
  String documentType;
  int documentNumber;
  String completeName;
  int lastDateEntry;
  int lastHourEntry;

  DataClient(documentType, documentNumber, completeName, lastDateEntry,
      lastHourEntry) {
    this.documentType = documentType;
    this.completeName = completeName;
    this.documentNumber = documentNumber;
    this.lastDateEntry = lastDateEntry;
    this.lastHourEntry = lastHourEntry;
  }
}

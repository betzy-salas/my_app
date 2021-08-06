class DataCommerce {
  int codeCommerce;
  int codeCommerceChild;
  double commerceBalance;
  String commerceName;

  DataCommerce(int codeCommerce, int codeCommerceChild, double commerceBalance,
      String commerceName) {
    this.codeCommerce = codeCommerce;
    this.codeCommerceChild = codeCommerceChild;
    this.commerceBalance = commerceBalance;
    this.commerceName = commerceName;
  }

  int get getCodeCommerce {
    return codeCommerce;
  }

  int get getCodeCommerceChild {
    return codeCommerceChild;
  }

  double get getCommerceBalance {
    return commerceBalance;
  }

  String get getCommerceName {
    return commerceName;
  }
}

import 'package:robo_front/model/product_barcode.dart';

class BasketItem {
  int index;
  int productID;
  ProductBarcode productBarcode;
  String amount;

  // These fields will not be added to the Request when sent
  double amountValue;
  String productName;

  BasketItem(
      {this.index,
      this.productID,
      this.productBarcode,
      this.amount,
      this.amountValue,
      this.productName});

  BasketItem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    productID = json['productID'];
    productBarcode = json['productBarcode'] != null
        ? new ProductBarcode.fromJson(json['productBarcode'])
        : null;
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['productID'] = this.productID;
    if (this.productBarcode != null) {
      data['productBarcode'] = this.productBarcode.toJson();
    }
    data['amount'] = this.amount;
    return data;
  }

  void setAmountValue(double _amountValue) {
    this.amountValue = _amountValue;
    this.amount = _amountValue.toString();
  }
}

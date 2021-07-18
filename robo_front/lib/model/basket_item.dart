import 'package:robo_front/model/product_barcode.dart';
import 'package:robo_front/model/status_detail.dart';

class BasketItem {
  int index;
  int productID;
  String productName;
  ProductBarcode productBarcode;
  String amount;
  String currencyCode;
  StatusDetail statusDetail;

  // These fields will not be added to the Request when sent
  double amountValue;

  BasketItem({
    this.index,
    this.productID,
    this.productBarcode,
    this.amount,
    this.amountValue,
    this.productName,
    this.currencyCode,
  });

  BasketItem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    productID = json['productID'];
    productName = json['productName'];
    productBarcode = json['productBarcode'] != null
        ? new ProductBarcode.fromJson(json['productBarcode'])
        : null;
    amount = json['amount'];
    currencyCode = json['currencyCode'];
    statusDetail = json['statusDetail'] != null
        ? new StatusDetail.fromJson(json['statusDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['productID'] = this.productID;
    data['productName'] = this.productName;
    if (this.productBarcode != null) {
      data['productBarcode'] = this.productBarcode.toJson();
    }
    if (this.statusDetail != null) {
      data['statusDetail'] = this.statusDetail.toJson();
    }
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }

  void setAmountValue(double _amountValue) {
    this.amountValue = _amountValue;
    this.amount = _amountValue.toString();
  }
}

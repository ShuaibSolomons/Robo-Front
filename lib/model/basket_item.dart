import 'package:robo_front/model/product_barcode.dart';
import 'package:robo_front/model/status_detail.dart';

class BasketItem {
  late int index;
  late int productID;
  late String productName;
  late ProductBarcode? productBarcode;
  late String amount;
  late String? currencyCode;
  late StatusDetail? statusDetail;

  // These fields will not be added to the Request when sent
  dynamic amountValue;

  BasketItem({
    required this.index,
    required this.productID,
    this.productBarcode,
    required this.amount,
    this.amountValue,
    required this.productName,
    this.currencyCode,
    this.statusDetail,
  });

  BasketItem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    productID = json['productID'];
    productName = json['productName'];
    productBarcode = (json['productBarcode'] != null
        ? new ProductBarcode.fromJson(json['productBarcode'])
        : null);
    amount = json['amount'];
    currencyCode = json['currencyCode'];
    statusDetail = (json['statusDetail'] != null
        ? new StatusDetail.fromJson(json['statusDetail'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['productID'] = this.productID;
    data['productName'] = this.productName;
    if (this.productBarcode != null) {
      data['productBarcode'] = this.productBarcode!.toJson();
    }
    if (this.statusDetail != null) {
      data['statusDetail'] = this.statusDetail!.toJson();
    }
    data['amount'] = this.amount;
    data['currencyCode'] = this.currencyCode;
    return data;
  }

  void setAmountValue(dynamic _amountValue) {
    this.amountValue = _amountValue;
    this.amount = _amountValue.toString();
  }
}

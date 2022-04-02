class ProductBarcode {
  late String barcode;
  late String serial;

  ProductBarcode({required this.barcode, required this.serial});

  ProductBarcode.fromJson(Map<String, dynamic> json) {
    barcode = json['barcode'];
    serial = json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['barcode'] = this.barcode;
    data['serial'] = this.serial;
    return data;
  }
}

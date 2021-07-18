class StatusDetail {
  int txResponseStatusCode;
  String txResponseStatusMessage;

  StatusDetail({this.txResponseStatusCode, this.txResponseStatusMessage});

  StatusDetail.fromJson(Map<String, dynamic> json) {
    txResponseStatusCode = json['txResponseStatusCode'];
    txResponseStatusMessage = json['txResponseStatusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txResponseStatusCode'] = this.txResponseStatusCode;
    data['txResponseStatusMessage'] = this.txResponseStatusMessage;
    return data;
  }
}

class CompanyDetail {
  int companyID;
  String companyName;
  String originCountry;
  int amountOfEmployees;
  bool active;

  CompanyDetail({this.companyName, this.originCountry});

  CompanyDetail.fromJson(Map<String, dynamic> json) {
    companyID = json['companyID'];
    companyName = json['companyName'];
    originCountry = json['originCountry'];
    amountOfEmployees = json['amountOfEmployees'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyID'] = this.companyID;
    data['companyName'] = this.companyName;
    data['originCountry'] = this.originCountry;
    data['amountOfEmployees'] = this.amountOfEmployees;
    data['active'] = this.active;
    return data;
  }
}

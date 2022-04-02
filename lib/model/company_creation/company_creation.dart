class CompanyCreation {
  late String companyName;
  late String originCountry;

  CompanyCreation({required this.companyName, required this.originCountry});

  CompanyCreation.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    originCountry = json['originCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyName'] = this.companyName;
    data['originCountry'] = this.originCountry;
    return data;
  }
}

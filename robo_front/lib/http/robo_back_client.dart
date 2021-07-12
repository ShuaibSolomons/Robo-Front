import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/base_response.dart';

class RoboBackClient {
  String protocol = 'e0e345c55a22.ngrok.io';

  Future<BaseResponse> getProductTypes(int storeID, int companyID) async {
    var url =
        Uri.http(protocol, '/api/product/productTypes/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }

  Future<BaseResponse> getProducts(
      int productTypeID, int storeID, int companyID) async {
    var url = Uri.http(
        protocol, '/api/product/products/$productTypeID/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }
}

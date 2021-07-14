import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/base_response.dart';

class RoboBackClient {
  String protocol = 'ff4e6929d824.ngrok.io';

  Future<BaseRoboResponse> getProductTypes(int storeID, int companyID) async {
    var url =
        Uri.http(protocol, '/api/product/productTypes/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }

  Future<BaseRoboResponse> getProducts(
      int productTypeID, int storeID, int companyID) async {
    var url = Uri.http(
        protocol, '/api/product/products/$productTypeID/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }

  Future<BaseRoboResponse> getMenu(int storeID, int companyID) async {
    var url = Uri.http(protocol, '/api/product/menu/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }
}

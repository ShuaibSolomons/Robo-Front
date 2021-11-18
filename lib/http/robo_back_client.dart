import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:robo_front/model/base_request.dart';
import 'package:robo_front/model/company_creation/company_creation.dart';
import 'package:robo_front/model/store_creation/store_creation_request.dart';
import '../model/base_response.dart';

class RoboBackClient {
  String protocol = 'robo-back.herokuapp.com';

  Future<BaseRoboResponse> getProductTypes(int storeID, int companyID) async {
    var url =
        Uri.http(protocol, '/api/product/productTypes/$storeID/$companyID');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product types');
    }
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

  Future<BaseRoboResponse> purchaseBasket(BaseRoboRequest request) async {
    var url = Uri.http(protocol, '/api/service/purchaseBasket');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Consumer-Platform': 'pos',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }

  Future<BaseRoboResponse> createCompany(CompanyCreation request) async {
    var url = Uri.http(protocol, '/api/institution/company');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Consumer-Platform': 'pos',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<BaseRoboResponse> createStore(StoreCreationRequest request) async {
    var url = Uri.http(protocol, '/api/institution/store');
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Consumer-Platform': 'pos',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {
      return BaseRoboResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}

import 'package:http/http.dart' as http;

class RoboBackClient {
  Object getProductTypes(int storeID, int companyID) async {
    var url = Uri.http(
        '10.0.2.2:30000', '/api/product/productTypes/$storeID/$companyID');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

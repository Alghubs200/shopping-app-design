import 'package:mvc_design/model/products_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<ProductModel>?> getProductModel() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return productModelFromJson(json);
    }
  }
}

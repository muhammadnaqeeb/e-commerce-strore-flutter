import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  var _productData;
  bool isLoading = false;

  get productData => _productData;

  getProductData() async {
    isLoading = true;
    _productData = await _getAllData();
    isLoading = false;
    notifyListeners();
  }

  ///////////////////////
  Future _getAllData() async {
    http.Response response =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      //print(decodedData);
      return decodedData;
    } else {
      //print(response.statusCode);
    }
  }
}

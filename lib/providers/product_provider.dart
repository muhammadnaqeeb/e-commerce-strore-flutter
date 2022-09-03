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

  // list for cart items
  var cartItemsList = [];
  get getcardItemsList => cartItemsList;

  void addProduct(var product) {
    cartItemsList.add(product);
    notifyListeners();
  }

  void removeProduct(int index) {
    cartItemsList.removeAt(index);
    notifyListeners();
  }

  incrementQuantity(int index, int incrementedValue) {
    cartItemsList[index]['quantity'] = incrementedValue;
    notifyListeners();
  }

  decrementQuantity(int index, int decrementedValue) {
    cartItemsList[index]['quantity'] = decrementedValue;
    notifyListeners();
  }

  var totalPrice = 0;
  calculatePrice() {
    totalPrice = 0;
    for (var product in cartItemsList) {
      int oneProductTotal = product['price'] * product['quantity'];
      totalPrice += oneProductTotal;
    }
    notifyListeners();
  }

  // end list for cart items

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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/services/network_error_screen.dart';
import 'package:store/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getProductData();
    super.initState();
  }

  void getProductData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var productData;
    try {
      productData = await networkHelper.getData();
      print(productData);
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NetworkErrorScreen();
      }));
      return;
    }

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }), ((route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Loading...'),
      ),
    );
  }
}

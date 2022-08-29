import 'package:flutter/material.dart';
import 'package:store/screens/all_product_screen.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int c_index = 0;
  final screens = [
    MyHomeScreen(),
    AllProductScreen(),
    ShoppingCarTScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: c_index,
        onTap: ((value) {
          setState(() {
            c_index = value;
          });
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'AllItems',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          )
        ],
      ),
      body: screens[c_index],
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Home Screen'),
      ),
    );
  }
}

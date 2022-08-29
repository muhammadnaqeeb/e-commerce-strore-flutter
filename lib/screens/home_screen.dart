import 'package:flutter/material.dart';
import 'package:store/screens/all_product_screen.dart';
import 'package:store/screens/favorite_product_screen.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int c_index = 0;
  final screens = [MyHomeScreen(), AllProductScreen(), FavoriteProductScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withAlpha(100),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: c_index,
        onTap: ((value) {
          setState(() {
            c_index = value;
          });
        }),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Icon(Icons.home),
            ),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'AllItems',
          ),
          BottomNavigationBarItem(
            icon: Container(
                margin: const EdgeInsets.only(right: 30),
                child: const Icon(Icons.favorite)),
            label: 'favorite',
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

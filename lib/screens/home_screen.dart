import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/all_product_screen.dart';
import 'package:store/screens/favorite_product_screen.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

import '../widgets/sale_slide_card.dart';

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

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<ProductProvider>(context, listen: false);
    dataProvider.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProductProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: const Icon(
          Icons.store,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Colors.black,
              onPressed: () {
                context.read<ProductProvider>().getProductData();
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 20,
              bottom: 15,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Today\'s Sales!',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.25,
            child: Swiper(
              itemCount: 3,
              itemBuilder: ((context, index) {
                return saleSlideCard();
              }),
              viewportFraction: 0.8,
              scale: 0.9,
              // pagination: const SwiperPagination(
              //   alignment: Alignment.bottomCenter,
              //   builder: DotSwiperPaginationBuilder(
              //     color: Colors.white,
              //     activeColor: Colors.red,
              //   ),
              // ),
              //control: SwiperControl(),
            ),
          ),
          Container(
            child: dataProvider.isLoading
                ? CircularProgressIndicator()
                : Text('${dataProvider.productData}'),
          )
        ],
      ),
    );
  }
}

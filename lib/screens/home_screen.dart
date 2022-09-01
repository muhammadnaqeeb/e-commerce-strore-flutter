import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/all_product_screen.dart';
import 'package:store/screens/favorite_product_screen.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';
import '../widgets/popular_item.dart';
import '../widgets/sale_slide_card.dart';
import '../widgets/shimmer_layout.dart';

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
      body: IndexedStack(
        index: c_index,
        children: screens,
      ),
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
    var productData = dataProvider.productData;
    final appBar = AppBar(
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
              context.read<ProductProvider>().calculatePrice();

              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return ShoppingCarTScreen();
              })));
            },
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    Size size = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    double btmNavigationBarHeight =
        Platform.isAndroid ? kBottomNavigationBarHeight : 90;
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: 35,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: const Align(
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
            height: (screenHeight -
                    appBarHeight -
                    statusBarHeight -
                    btmNavigationBarHeight -
                    35) *
                .35,
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
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('see all'),
                      )
                    ],
                  ),
                ),
                dataProvider.isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (ctx, i) {
                              return Container(
                                child: loadingShimmer(),
                              );
                            }),
                      )
                    : SizedBox(
                        height: (screenHeight -
                                appBarHeight -
                                statusBarHeight -
                                btmNavigationBarHeight -
                                35 -
                                50) *
                            0.60,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return PopularItem(
                                imageUrl: productData[index]['category']
                                    ['image'],
                                productTitle: productData[index]['title'],
                                productCatagory: productData[index]['category']
                                    ['name'],
                                productPrice: productData[index]['price'],
                                description: productData[index]['description'],
                              );
                            }),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

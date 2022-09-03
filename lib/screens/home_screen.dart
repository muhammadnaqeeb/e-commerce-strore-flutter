import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/discount_model.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/all_product_screen.dart';
import 'package:store/screens/person_screen.dart';
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
  final screens = [MyHomeScreen(), AllProductScreen(), PersonScreen()];
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
              child: const Icon(Icons.roofing_rounded),
            ),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_rounded),
            label: 'AllItems',
          ),
          BottomNavigationBarItem(
            icon: Container(
                margin: const EdgeInsets.only(right: 30),
                child: const Icon(Icons.person_outline_rounded)),
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
        Icons.shopping_bag_outlined,
        color: Colors.black,
      ),
      titleSpacing: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_rounded),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: dataProvider.getcardItemsList.length > 0
                      ? CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.red,
                          child: Center(
                            child: Text(
                              '${dataProvider.getcardItemsList.length}',
                              style: const TextStyle(fontSize: 6),
                            ),
                          ),
                        )
                      : const Text(''),
                )
              ],
            ),
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
    List<Discount> discountList = Discount.discounts;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    double btmNavigationBarHeight =
        Platform.isAndroid ? kBottomNavigationBarHeight : 90;

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: appBar,
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 15),
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
              height: isPortrait
                  ? (screenHeight -
                          appBarHeight -
                          statusBarHeight -
                          btmNavigationBarHeight -
                          35) *
                      .32
                  : (screenHeight -
                          appBarHeight -
                          statusBarHeight -
                          btmNavigationBarHeight -
                          35) *
                      .95,
              child: Swiper(
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return SaleSlideCard(
                    discount: discountList[index].discount,
                    description: discountList[index].description,
                    img: discountList[index].img,
                  );
                }),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  dataProvider.isLoading
                      ? SizedBox(
                          height: (screenHeight -
                                  appBarHeight -
                                  statusBarHeight -
                                  btmNavigationBarHeight -
                                  35 -
                                  50) *
                              0.60,
                          width: double.infinity,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (ctx, i) {
                                return Container(
                                  child: loadingShimmer(),
                                );
                              }),
                        )
                      : SizedBox(
                          height: isPortrait
                              ? (screenHeight -
                                      appBarHeight -
                                      statusBarHeight -
                                      btmNavigationBarHeight -
                                      35 -
                                      50) *
                                  0.60
                              : (screenHeight -
                                      appBarHeight -
                                      statusBarHeight -
                                      btmNavigationBarHeight -
                                      35 -
                                      50) *
                                  1,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: 10,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext ctxt, int index) {
                                return PopularItem(
                                  imageUrl: productData[index]['category']
                                      ['image'],
                                  productTitle: productData[index]['title'],
                                  productCatagory: productData[index]
                                      ['category']['name'],
                                  productPrice: productData[index]['price'],
                                  description: productData[index]
                                      ['description'],
                                );
                              }),
                        ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}

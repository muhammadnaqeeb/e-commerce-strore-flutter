import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

import '../providers/product_provider.dart';
import '../widgets/all_product_card.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
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

    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    double btmNavigationBarHeight =
        Platform.isAndroid ? kBottomNavigationBarHeight : 90;

    return Scaffold(
      appBar: appBar,
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          hintText: "Search",
                          fillColor: Colors.grey.shade200,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 55,
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.tune,
                                color: Colors.white,
                              )),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                //////////no need of height now/////////
                height: (screenHeight -
                    appBarHeight -
                    statusBarHeight -
                    btmNavigationBarHeight -
                    15 -
                    60),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: productData == null ? 0 : productData.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 210,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemBuilder: ((context, index) {
                    return productData == null
                        ? const Center(child: Text('Loading..'))
                        : AllProductCard(
                            category: productData[index]['category']['name'],
                            description: productData[index]['description'],
                            imgUrl: productData[index]['category']['image'],
                            title: productData[index]['title'],
                            price: productData[index]['price'],
                          );
                  }),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

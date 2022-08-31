import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

import '../providers/product_provider.dart';
import '../widgets/all_product_card.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProductProvider>(context);
    var productData = dataProvider.productData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Naqeeb',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return ShoppingCarTScreen();
              })));
              context.read<ProductProvider>().calculatePrice();
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
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
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.builder(
                itemCount: 10,
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
    );
  }
}

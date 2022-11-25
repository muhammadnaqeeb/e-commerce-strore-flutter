import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/screens/shopping_cart_sceeen.dart';

import '../providers/product_provider.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40,
              child: Image(image: AssetImage('images/chair.png')),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Muhammad Naqeeb',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade200),
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: const Text(
                'Member',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

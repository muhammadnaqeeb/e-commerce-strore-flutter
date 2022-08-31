import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';

class ShoppingCarTScreen extends StatefulWidget {
  const ShoppingCarTScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCarTScreen> createState() => _ShoppingCarTScreenState();
}

class _ShoppingCarTScreenState extends State<ShoppingCarTScreen> {
  @override
  Widget build(BuildContext context) {
    var cardItemList = context.watch<ProductProvider>().getcardItemsList;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: cardItemList.length,
            itemBuilder: ((context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        cardItemList[index]['title'],
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'x${cardItemList[index]['quantity']}',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            context.read<ProductProvider>().incrementQuantity(
                                index, cardItemList[index]['quantity'] + 1);
                          },
                          child: Icon(Icons.add)),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            context.read<ProductProvider>().decrementQuantity(
                                index, cardItemList[index]['quantity'] - 1);
                          },
                          child: Icon(Icons.remove)),
                    ],
                  ),
                  Text("\$ ${cardItemList[index]['price']}")
                ],
              );
            }),
          )),
    );
  }
}

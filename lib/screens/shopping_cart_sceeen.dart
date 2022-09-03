import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/widgets/custom_buttom.dart';

class ShoppingCarTScreen extends StatefulWidget {
  const ShoppingCarTScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCarTScreen> createState() => _ShoppingCarTScreenState();
}

class _ShoppingCarTScreenState extends State<ShoppingCarTScreen> {
  @override
  Widget build(BuildContext context) {
    var cardItemList = context.watch<ProductProvider>().getcardItemsList;
    var productProvider = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 0, left: 20, right: 20),
                height: MediaQuery.of(context).size.height * 0.70,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cardItemList.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(cardItemList[index]['img']),
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cardItemList[index]['title'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "\$${cardItemList[index]['price']}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '  x${cardItemList[index]['quantity']}',
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<ProductProvider>()
                                                  .incrementQuantity(
                                                      index,
                                                      cardItemList[index]
                                                              ['quantity'] +
                                                          1);

                                              context
                                                  .read<ProductProvider>()
                                                  .calculatePrice();
                                            },
                                            child: const Icon(Icons.add_circle),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (cardItemList[index]
                                                      ['quantity'] <=
                                                  1) {
                                                return;
                                              }
                                              context
                                                  .read<ProductProvider>()
                                                  .decrementQuantity(
                                                      index,
                                                      cardItemList[index]
                                                              ['quantity'] -
                                                          1);

                                              context
                                                  .read<ProductProvider>()
                                                  .calculatePrice();
                                            },
                                            child:
                                                const Icon(Icons.remove_circle),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<ProductProvider>()
                                      .removeProduct(index);
                                  context
                                      .read<ProductProvider>()
                                      .calculatePrice();
                                },
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1.1,
                        )
                      ],
                    );
                  }),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Total',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
                icon: Icons.account_balance,
                buttonText: 'Proceed',
                price: productProvider.totalPrice),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

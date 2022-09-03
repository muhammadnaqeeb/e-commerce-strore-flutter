import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/single_product_description_screen.dart';
import 'custom_snackbar_layout.dart';

class AllProductCard extends StatefulWidget {
  String imgUrl;
  String title;
  int price;
  String? category;
  String? description;

  AllProductCard({
    required this.title,
    required this.imgUrl,
    required this.price,
    this.category,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  State<AllProductCard> createState() => _AllProductCardState();
}

class _AllProductCardState extends State<AllProductCard> {
  bool changeFavourateIcon = false;
  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductProvider>();
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return ProductDescription_Screen(
            imgUrl: widget.imgUrl,
            catogory: widget.category!,
            price: widget.price,
            title: widget.title,
            description: widget.description!,
          );
        })));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image(
                  image: NetworkImage(widget.imgUrl),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text(
                          widget.title,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${widget.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      // IconButton(
                      //     onPressed: () {}, icon: const Icon(Icons.favorite)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              changeFavourateIcon = !changeFavourateIcon;
                            });
                          },
                          child: changeFavourateIcon
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_outline_rounded,
                                )),
                      GestureDetector(
                        onTap: () {
                          context.read<ProductProvider>().addProduct({
                            'title': widget.title,
                            'quantity': 1,
                            'price': widget.price,
                            'img': widget.imgUrl
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: CustomSnackbarLayout(),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 1500),
                          ));
                        },
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

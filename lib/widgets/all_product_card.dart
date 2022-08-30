import 'package:flutter/material.dart';

class AllProductCard extends StatelessWidget {
  String imgUrl;
  String title;
  int price;

  AllProductCard({
    required this.title,
    required this.imgUrl,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: NetworkImage(imgUrl),
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
                        title,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$$price',
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
                          print('Favorite Clicked');
                        },
                        child: Icon(Icons.favorite)),
                    GestureDetector(
                        onTap: () {
                          print('Add Clicked');
                        },
                        child: Icon(Icons.shopping_cart)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

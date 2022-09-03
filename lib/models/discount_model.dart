class Discount {
  String discount;
  String description;
  String img;

  Discount({
    required this.discount,
    required this.description,
    required this.img,
  });

  static List<Discount> discounts = [
    Discount(
        discount: '70%', description: 'on Furniture', img: 'images/chair.png'),
    Discount(
        discount: '50%',
        description: 'on Children Cloths',
        img: 'images/children_cloths.png'),
    Discount(
        discount: '30%',
        description: 'on Shoes Items',
        img: 'images/shoes.png'),
  ];
}

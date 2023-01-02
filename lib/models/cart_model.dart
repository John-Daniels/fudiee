class Cart {
  Cart({
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
    this.rating = 1,
    this.itemCount = 1,
  });

  String image;
  String title;
  String desc;
  double price;
  double rating;
  int itemCount;
}

class ProductModel {
  final String name, disc, image;
  final int price;

  ProductModel(
      {required this.name,
      required this.disc,
      required this.image,
      required this.price});
  static List<ProductModel> product = [
    ProductModel(
        name: 'October collection',
        disc: 'reversible angora cardigan',
        image: 'assets/product/product6.png',
        price: 120),
    ProductModel(
        name: 'October collection',
        disc: 'perfect shoze',
        image: 'assets/product/product1.png',
        price: 180),
    ProductModel(
        name: 'October collection',
        disc: 'mnemo',
        image: 'assets/product/product2.png',
        price: 90),
    ProductModel(
        name: 'October collection',
        disc: 'mnemo',
        image: 'assets/product/product3.png',
        price: 70),
    ProductModel(
        name: 'October collection',
        disc: 'mnemo',
        image: 'assets/product/product4.png',
        price: 150),
    ProductModel(
        name: 'October collection',
        disc: 'mnemo',
        image: 'assets/product/product5.png',
        price: 60),
  ];
}

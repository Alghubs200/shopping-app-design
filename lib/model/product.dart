class HomeProduct {
  HomeProduct(
      {required this.image, required this.name, required this.isSelected});

  final String image;

  final String name;

  late final isSelected;

  static List<HomeProduct> getHomeProducts() {
    return [
      HomeProduct(
          image: 'asset/gmaing_laptop.jpg',
          name: 'Gaming Laptops',
          isSelected: true),
      HomeProduct(
          image: 'asset/headphone.jpg', name: 'Headphones', isSelected: false),
      HomeProduct(image: 'asset/Watch.png', name: 'Watches', isSelected: false),
      HomeProduct(
          image: 'asset/laptop.jpg', name: 'Laptops', isSelected: false),
    ];
  }
}

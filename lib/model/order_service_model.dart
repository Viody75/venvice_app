class OrderCart {
  OrderCart(
      {this.name = '',
      this.imageAsset = '',
      this.price = 0,
      this.estTime = 0,
      this.qty = 0});

  String name;
  String imageAsset;
  int price;
  int estTime;
  int qty;
}

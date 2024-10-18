class ProductModel {
  int id = 0;
  String name = '';
  String description = '';
  int price = 0;
  List<String> images = [];

  ProductModel(
    this.id,
    this.name,
    this.description,
    this.price,
    this.images,
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['title'];
    description = json['description'];
    price = json['price'];
    images = json['images'].cast<String>();
  }
}

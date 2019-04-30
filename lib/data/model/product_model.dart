class Product {
  int id;
  String title;
  String image;
  bool liked;
  String url;
  bool status;
  int amount;

  Product({this.id, this.title, this.image, this.liked, this.url,this.status,this.amount});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["ID"],
        title: json["TITLE"],
        image: json["IMAGE"],
        liked: json["LIKED"],
        url: json["URL"],status: false,amount: 1);
  }

  @override
  String toString() {
    return 'Data{id: $id, title: $title, image: $image, liked: $liked, url: $url}';
  }

}

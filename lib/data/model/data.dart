class Data {
  int id;
  String title;
  String image;
  bool liked;
  String url;
  bool status=false;
  int amount;

  Data({this.id, this.title, this.image, this.liked, this.url,this.status,this.amount});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
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

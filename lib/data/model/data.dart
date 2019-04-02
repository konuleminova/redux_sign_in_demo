class Data {
  int id;
  String title;
  String image;
  bool liked;
  String url;

  Data({this.id, this.title, this.image, this.liked, this.url});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json["ID"],
        title: json["TITLE"],
        image: json["IMAGE"],
        liked: json["LIKED"],
        url: json["URL"]);
  }

  @override
  String toString() {
    return 'Data{id: $id, title: $title, image: $image, liked: $liked, url: $url}';
  }

}

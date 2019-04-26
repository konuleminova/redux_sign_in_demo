import 'package:redux_sign_in/data/model/data.dart';

class Home {
  String result;
  List<Product> data;

  Home({this.result, this.data});

  factory Home.fromJson(Map<String, dynamic> json)  {
    var list = json["DATA"] as List;
    print(list); //returns List<dynamic>
    List<Product>  lists = list.map<Product>((json) => Product.fromJson(json)).toList();
    return Home(result: json["RESULT"], data: lists);
  }

  @override
  String toString() {
    return 'Home{result: $result, data: $data}';
  }


}

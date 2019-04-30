import 'package:redux_sign_in/data/model/product_model.dart';

class Home {
  String result;
  List<Product> data;

  Home({this.result, this.data});

  factory Home.fromJson(Map<String, dynamic> json) {
    var list = json["DATA"] as List;
    print(list); //returns List<dynamic>
    List<Product> lists =
        list.map<Product>((json) => Product.fromJson(json)).toList();
    return Home(result: json["RESULT"], data: lists);
  }

  Home copyWith({String result, List<Product> data}) {
    return Home(result: result ?? this.result, data: data ?? this.data);
  }

  @override
  String toString() {
    return 'Home{result: $result, data: $data}';
  }
}

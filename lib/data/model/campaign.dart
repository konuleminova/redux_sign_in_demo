import 'package:redux_sign_in/data/model/data.dart';

class Campaign {
  String result;
  List<Data> data;

  Campaign({this.result, this.data});

  factory Campaign.fromJson(Map<String, dynamic> json)  {
    var list = json["DATA"] as List;
    print(list); //returns List<dynamic>
    List<Data>  lists = list.map<Data>((json) => Data.fromJson(json)).toList();
    return Campaign(result: json["RESULT"], data: lists);
  }

  @override
  String toString() {
    return 'Campaign{result: $result, data: $data}';
  }

}

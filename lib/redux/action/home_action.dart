import 'package:redux_sign_in/data/model/home_model.dart';
import 'package:redux_sign_in/data/model/product_model.dart';

class FetchProductsAction {
  String result;
  List<Product> data;

  FetchProductsAction({this.result, this.data});
}

class AddProductAction {
  Product product;
  AddProductAction({this.product});
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  final String isLoginKey = "User has login";

  Future<bool> getUserHasLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(isLoginKey) ?? false;
  }
  setUserLogin(bool value)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool(isLoginKey, value);
  }
}
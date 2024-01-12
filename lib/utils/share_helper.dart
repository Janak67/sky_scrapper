import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }

  Future<void> setCity(List<String> cityList) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookmark", cityList);
  }

  Future<List<String>?> getCityData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("bookmark");
  }
}

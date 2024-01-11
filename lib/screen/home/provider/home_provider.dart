import 'package:flutter/material.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;
  bool isLight = true;

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.weatherApiCall();
    homeModel = h1;
    notifyListeners();
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}

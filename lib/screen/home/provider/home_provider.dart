import 'package:flutter/material.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.weatherApiCall();
    homeModel = h1;
    notifyListeners();
  }
}

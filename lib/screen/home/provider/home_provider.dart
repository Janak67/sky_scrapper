import 'package:flutter/material.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/utils/api_helper.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;
  bool isLight = true;
  String citySearch = 'surat';
  bool isOnline = false;
  List<String>? bookMarkCity = [];

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    HomeModel? h1 = await apiHelper.weatherApiCall(citySearch);
    homeModel = h1;
    notifyListeners();
  }

  void citySearchData(String search) {
    citySearch = search;
    notifyListeners();
  }

  //Theme
  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  //BookMark
  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    List<String>? book = await shareHelper.getCityData();
    if (book != null) {
      bookMarkCity = book;
    }
    notifyListeners();
  }

  void addBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkCity!.add(citySearch);
    shareHelper.setCity(bookMarkCity!);
    notifyListeners();
  }

  void deleteBookMark() {
    ShareHelper shareHelper = ShareHelper();
    bookMarkCity!.remove(citySearch);
    shareHelper.setCity(bookMarkCity!);
    notifyListeners();
  }
}

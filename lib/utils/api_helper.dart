import 'dart:convert';

import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  Future<HomeModel?> weatherApiCall() async {
    String apiLink =
        "https://api.openweathermap.org/data/2.5/weather?q=surat&appid=f328d45c82255838461c68c2ab810685";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      HomeModel homeModel = HomeModel.mapToModel(json);
      return homeModel;
    }
    return null;
  }
}

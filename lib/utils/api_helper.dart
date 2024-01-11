import 'dart:convert';

import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  Future<HomeModel?> weatherApiCall(String city) async {
    String apiLink =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=6e2a97e08f38f6d24bc52bc3f1a5c97a";
    // "https://api.openweathermap.org/data/2.5/weather?q=surat&appid=ae7fb45f57d3c4d4a67de3204d0ea804";
    // "https://api.openweathermap.org/data/2.5/weather?q=surat&appid=3d5b80cdb356bb109cf6315e49a4e4ed";
    var response = await http.get(Uri.parse(apiLink));
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // print(json);
      HomeModel homeModel = HomeModel.mapToModel(json);
      return homeModel;
    }
    return null;
  }
}

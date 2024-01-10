import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        routes: screen_routes,
      ),
    ),
  );
}

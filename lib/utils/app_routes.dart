import 'package:flutter/material.dart';
import 'package:sky_scrapper/screen/home/view/home_screen.dart';
import 'package:sky_scrapper/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'home': (context) => const HomeScreen(),
};

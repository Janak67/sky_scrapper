import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/app_routes.dart';
import 'package:sky_scrapper/utils/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.isLight ? lightTheme : darkTheme,
            routes: screen_routes,
          );
        },
      ),
    ),
  );
}

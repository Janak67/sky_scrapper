import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';

class NetworkConnection {
  Connectivity networkConnectivity = Connectivity();

  Future<void> checkConnection(BuildContext context) async {
    ConnectivityResult result = await networkConnectivity.checkConnectivity();
    // ignore: use_build_context_synchronously
    checkStatus(result, context);
    networkConnectivity.onConnectivityChanged.listen((event) {
      checkStatus(event, context);
    });
  }

  void checkStatus(ConnectivityResult result, BuildContext context) {
    if (result.index == 1 || result.index == 3) {
      context.read<HomeProvider>().changeStatus(true);
    } else {
      context.read<HomeProvider>().changeStatus(false);
    }
  }
}

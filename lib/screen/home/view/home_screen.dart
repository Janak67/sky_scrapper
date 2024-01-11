import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Weather'),
        ),
        body: FutureBuilder(
          future: providerr!.getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              return Stack(
                children: [
                  Image.asset(
                    'assets/img/home1.jpg',
                    height: MediaQuery.sizeOf(context).height,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          '${providerr!.homeModel!.name}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        const SizedBox(height: 100),
                        Text(
                          '${providerr!.homeModel!.cloudsModel!.all}°C',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 70),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.light_mode_outlined),
                    const SizedBox(width: 8),
                    const Text('Theme'),
                    const Spacer(),
                    Consumer<HomeProvider>(
                      builder: (context, value1, child) => Switch(
                        value: value1.isLight,
                        onChanged: (value) {
                          ShareHelper shr = ShareHelper();
                          shr.setTheme(value);
                          value1.changeTheme();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

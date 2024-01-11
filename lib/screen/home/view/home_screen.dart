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
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWeatherData();
  }

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
        body: providerw!.homeModel == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Image.asset(
                    'assets/img/home1.jpg',
                    height: MediaQuery.sizeOf(context).height,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Center(
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
                                fontSize: 70, color: Colors.black),
                          ),
                          const SizedBox(height: 100),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Colors.white24, Colors.black12],
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.44,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.air),
                                          const Text(
                                            'Wind Speed',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${providerr!.homeModel!.windModel!.speed} km/h',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.44,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.speed),
                                          const Text(
                                            'Pressure',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${providerr!.homeModel!.mainModel!.pressure} hPa',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.44,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // const Icon(Icons.wind_power),
                                          // const Icon(Icons.water_drop),
                                          const Icon(Icons.remove_red_eye),
                                          // const Icon(Icons.speed),
                                          const Text(
                                            'Visibility',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${providerr!.homeModel!.visibility}',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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

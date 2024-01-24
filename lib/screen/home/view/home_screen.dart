import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/network.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  NetworkConnection networkConnection = NetworkConnection();

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getWeatherData();
    networkConnection.checkConnection(context);
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
          actions: [
            IconButton(
              onPressed: () {
                providerr!.getBookMark();
                if (!providerr!.bookMarkCity!.contains(providerr!.citySearch)) {
                  providerr!.addBookMark();
                } else {
                  providerr!.deleteBookMark();
                }
              },
              // onPressed: () async {
              //   providerr!.bookMarkCity!.add(providerw!.citySearch);
              //   ShareHelper shareHelper = ShareHelper();
              //   await shareHelper.setCity(providerr!.bookMarkCity!);
              //   providerr!.getBookMark();
              // },
              icon: Icon(
                  providerw!.bookMarkCity!.contains(providerr!.citySearch) ==
                          true
                      ? Icons.bookmark
                      : Icons.bookmark_outline),
            ),
          ],
        ),
        body: providerw!.homeModel == null
            ? const Center(child: CircularProgressIndicator())
            : providerw!.isOnline
                ? Stack(
                    children: [
                      Image.asset(
                        'assets/img/home1.jpg',
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SearchBar(
                                  hintText: 'Search...',
                                  leading: const Icon(Icons.search_outlined),
                                  trailing: const [
                                    Icon(Icons.keyboard_voice_outlined),
                                  ],
                                  onSubmitted: (value) {
                                    providerr!.citySearchData(value);
                                    providerr!.getWeatherData();
                                  },
                                  elevation:
                                      const MaterialStatePropertyAll(0.3),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'detail',
                                      arguments: providerw!.homeModel);
                                },
                                child: Text(
                                  '${providerr!.homeModel!.name}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 25),
                                ),
                              ),
                              const SizedBox(height: 60),
                              Text(
                                '${providerr!.homeModel!.cloudsModel!.all}°C',
                                style: const TextStyle(
                                    fontSize: 70, color: Colors.black),
                              ),
                              Text(
                                '${providerr!.homeModel!.weatherList![0].main}',
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 25),
                              ),
                              const SizedBox(height: 60),
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
                                        buildExpanded(
                                            'Wind Speed',
                                            '${providerr!.homeModel!.windModel!.speed} km/h',
                                            Icons.air_outlined),
                                        buildExpanded(
                                            'Temperature',
                                            '${providerr!.homeModel!.mainModel!.temp}',
                                            Icons.thermostat),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        buildExpanded(
                                            'Feels Like',
                                            '${providerr!.homeModel!.mainModel!.feels_like}',
                                            Icons.thermostat_outlined),
                                        buildExpanded(
                                            'Humidity',
                                            '${providerr!.homeModel!.mainModel!.humidity} %',
                                            Icons.water_drop),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        buildExpanded(
                                            'Pressure',
                                            '${providerr!.homeModel!.mainModel!.pressure} hPa',
                                            Icons.speed),
                                        buildExpanded(
                                            'Visibility',
                                            '${providerr!.homeModel!.visibility}',
                                            Icons.remove_red_eye),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [Colors.white24, Colors.white24],
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        buildExpanded(
                                            'MiniMum Temperature',
                                            '${providerr!.homeModel!.mainModel!.temp_min}',
                                            Icons.thermostat),
                                        buildExpanded(
                                            'MaxiMum Temperature',
                                            '${providerr!.homeModel!.mainModel!.temp_max}',
                                            Icons.thermostat),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        buildExpanded(
                                            'Sunrise',
                                            '${providerr!.homeModel!.sysModel!.sunrise}',
                                            Icons.sunny),
                                        buildExpanded(
                                            'Sunset',
                                            '${providerr!.homeModel!.sysModel!.sunset}',
                                            Icons.wb_sunny_sharp),
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
                  )
                : Center(
                    child: Image.asset(
                      'assets/img/network.jpg',
                      height: MediaQuery.sizeOf(context).height,
                      fit: BoxFit.cover,
                    ),
                  ),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: providerw!.bookMarkCity!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  providerw!.bookMarkCity![index],
                  style: const TextStyle(fontSize: 25),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildExpanded(String name, String detail, dynamic icon) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.44,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            detail,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

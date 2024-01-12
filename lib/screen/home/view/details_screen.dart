import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screen/home/model/home_model.dart';
import 'package:sky_scrapper/screen/home/provider/home_provider.dart';
import 'package:sky_scrapper/utils/share_helper.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel h1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('City Management'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 10),
                          Text('Settings'),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(Icons.light_mode_outlined),
                        const SizedBox(width: 8),
                        const Text('Theme'),
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
                ];
              },
            )
          ],
        ),
        body: h1.weatherList == null
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Image.asset(
                    'assets/img/detail.jpg',
                    height: MediaQuery.sizeOf(context).height,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'City',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          buildRowTile('City :- ${h1.name}', Icons.location_on),
                          const SizedBox(height: 10),
                          buildRowTile(
                              'Country :- ${h1.sysModel!.country}', Icons.cabin),
                          const Divider(thickness: 1),
                          const Text(
                            'Location',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          buildRowTile('lat :- ${h1.coordModel!.lat}', Icons.map),
                          const SizedBox(height: 10),
                          buildRowTile('lon :- ${h1.coordModel!.lon}', Icons.map),
                          const SizedBox(height: 80),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    Icon(Icons.cloud),
                                    SizedBox(height: 8),
                                    Text('Now',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '02:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '04:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '06:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '08:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '10:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '12:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '14:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '16:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '18:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '20:00'),
                                const SizedBox(width: 17),
                                buildColumn(Icons.sunny, '22:00'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 0.3),
                          const SizedBox(height: 10),
                          buildRow('01/ Today', '☀️', '20/33'),
                          buildRow('01/11 Sat', '🌨️', '18/33'),
                          buildRow('01/11 Sun', '🌤️', '17/31'),
                          buildRow('01/11 Mon', '🌤️', '14/30'),
                          buildRow('01/11 Tue', '🌤️', '16/31'),
                          buildRow('01/11 Wed', '🌤️', '15/30'),
                          buildRow('01/11 Thu', '🌤️', '15/27'),
                          buildRow('01/11 Fri', '🌤️', '14/28'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildRowTile(String name, dynamic icon) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Icon(icon),
      ],
    );
  }

  Widget buildColumn(dynamic icon, String time) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(height: 8),
        Text(time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget buildRow(String day, String icon, String date) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            icon,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Text(
            date,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

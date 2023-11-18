import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String country = 'Nigeria';
  late Future<Map<String, dynamic>> weather = getWeatherData();
  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      final String uri =
          'https://api.openweathermap.org/data/2.5/forecast?q=$country&APPID=$openWeatherAPIKey';
      final res = await http.get(Uri.parse(uri));
      final Map<String, dynamic> data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'An unexpected error occured';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 12,
          ),
          child: FutureBuilder(
            future: weather,
            builder: (context, snapshot) {
              // checking for loading state
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );

                // checking for loading error
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                );
              }
              //asigning variables
              final currentWeatherData = snapshot.data!['list'][0];
              final DateTime date =
                  DateTime.parse(currentWeatherData['dt_txt']);
              final formattedDate =
                  DateFormat.d().add_LLLL().add_y().format(date);
              final currentTemp =
                  (currentWeatherData['main']['temp'].ceil() - 273).toString();
              final currentSky = currentWeatherData['weather'][0]['main'];
              final currentSpeed =
                  currentWeatherData['wind']['speed'].toString();
              final humidity =
                  currentWeatherData['main']['humidity'].toString();
              final pressure =
                  currentWeatherData['main']['pressure'].toString();
              final IconData currentWeatherIcon;
              if (currentSky == 'Clouds') {
                currentWeatherIcon = Icons.cloud;
              } else if (currentSky == 'Rain') {
                currentWeatherIcon = Icons.water_drop;
              } else {
                currentWeatherIcon = Icons.sunny;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Top elements
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(formattedDate.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              )),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            weather = getWeatherData();
                          });
                        },
                        child: const Icon(
                          Icons.refresh,
                          size: 34,
                        ),
                      ),
                    ],
                  ),

                  //Divider
                  const Divider(),

                  const SizedBox(height: 24),

                  //Main Weather information
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 1080) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$currentTemp °C',
                                  style: const TextStyle(
                                    fontSize: 150,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  currentSky,
                                  style: const TextStyle(
                                    fontSize: 54,
                                  ),
                                ),
                                Icon(
                                  currentWeatherIcon,
                                  size: 128,
                                ),
                              ],
                            ),
                            Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AdditionalInfoItem(
                                      icon: Icons.air,
                                      value: '$currentSpeed m/s',
                                      text: 'Wind',
                                    ),
                                    AdditionalInfoItem(
                                      icon: Icons.invert_colors,
                                      value: '$humidity%',
                                      text: 'Humidity',
                                    ),
                                    AdditionalInfoItem(
                                      icon: Icons.trending_up,
                                      value: pressure,
                                      text: 'Pressure',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            //////////
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$currentTemp °C',
                                      style: const TextStyle(
                                        fontSize: 72,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      currentSky,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  currentWeatherIcon,
                                  size: 98,
                                )
                              ],
                            ),
                            const SizedBox(height: 30),

                            //Additional Weather information
                            Card(
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AdditionalInfoItem(
                                      icon: Icons.air,
                                      value: '$currentSpeed m/s',
                                      text: 'Wind',
                                    ),
                                    AdditionalInfoItem(
                                      icon: Icons.invert_colors,
                                      value: '$humidity%',
                                      text: 'Humidity',
                                    ),
                                    AdditionalInfoItem(
                                      icon: Icons.trending_up,
                                      value: pressure,
                                      text: 'Pressure',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // buttom hourly forecast
                          ],
                        );
                      }
                    },
                  ),
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final forecastData = snapshot.data!['list'][index + 1];
                        final DateTime forecastDate =
                            DateTime.parse(forecastData['dt_txt']);
                        final formattedForecastDate =
                            DateFormat.j().format(forecastDate).toString();
                        final forecastTemp =
                            (forecastData['main']['temp'].ceil() - 273)
                                .toString();
                        final forecastSky = forecastData['weather'][0]['main'];
                        final IconData forecastIcon;
                        if (forecastSky == 'Clouds') {
                          forecastIcon = Icons.cloud;
                        } else if (forecastSky == 'Rain') {
                          forecastIcon = Icons.water_drop;
                        } else {
                          forecastIcon = Icons.sunny;
                        }

                        return HourlyForecastItem(
                          time: formattedForecastDate,
                          temp: "$forecastTemp °C",
                          icon: forecastIcon,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

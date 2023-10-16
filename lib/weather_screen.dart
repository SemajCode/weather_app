import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getWeatherData() async {
    try {
      const String uri =
          'https://api.openweathermap.org/data/2.5/forecast?q=Nigeria&APPID=$openWeatherAPIKey';
      final res = await http.get(Uri.parse(uri));
      final data = jsonDecode(res);
    } catch (e) {}

    return Future(() => null);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 12,
          ),
          child: Column(
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
                        'Nigeria',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text('17 October 2023',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    ],
                  ),
                  Icon(
                    Icons.refresh,
                    size: 34,
                  ),
                ],
              ),

              //Divider
              Divider(),

              SizedBox(height: 24),

              //Main Weather information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '32 °C',
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'sunny',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.sunny,
                    size: 98,
                  ),
                ],
              ),
              SizedBox(height: 30),

              //Additional Weather information
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AdditionalInfoItem(
                        icon: Icons.cloud,
                        value: '23 m/s',
                        text: 'text',
                      ),
                      AdditionalInfoItem(
                        icon: Icons.cloud,
                        value: '23 m/s',
                        text: 'text',
                      ),
                      AdditionalInfoItem(
                        icon: Icons.cloud,
                        value: '23 m/s',
                        text: 'text',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // buttom hourly forecast
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  HourlyForecastItem(
                    time: '9 AM',
                    temp: "16°",
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9 AM',
                    temp: "16°",
                    icon: Icons.cloud,
                  ),
                  HourlyForecastItem(
                    time: '9 AM',
                    temp: "16°",
                    icon: Icons.cloud,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

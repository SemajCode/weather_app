import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
                      Column(
                        children: [
                          Icon(
                            Icons.cloud,
                            size: 38,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '15 m/s',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Wind',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.cloud,
                            size: 38,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '15 m/s',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Wind',
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.cloud,
                            size: 38,
                          ),
                          SizedBox(height: 8),
                          Text(
                            '15 m/s',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Wind',
                          ),
                        ],
                      ),
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
                  SizedBox(
                    width: 100,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('9 AM'),
                            SizedBox(height: 8),
                            Icon(Icons.cloud),
                            SizedBox(height: 8),
                            Text(
                              '16°',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('9 AM'),
                            SizedBox(height: 8),
                            Icon(Icons.cloud),
                            SizedBox(height: 8),
                            Text(
                              '16°',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('9 AM'),
                            SizedBox(height: 8),
                            Icon(Icons.cloud),
                            SizedBox(height: 8),
                            Text(
                              '16°',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

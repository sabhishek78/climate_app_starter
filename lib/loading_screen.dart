import 'package:clima/location_screen.dart';
import 'package:clima/network_helper.dart';
import 'package:flutter/material.dart';

import 'location.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location currentLocation =Location();
  @override
  void initState(){
    super.initState();
    print('Init State called');
    getCurrentLocation();
  }
  void getCurrentLocation()async{
   //Location location=Location();
    await currentLocation.getLocation();
    print(currentLocation.latitude);
    print(currentLocation.longitude);
    fetchWeatherData();
  }
  void fetchWeatherData() async {
    print('https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=4f7b32dc58f4ac156caec77d106358f8');
    NetworkHelper helper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=4f7b32dc58f4ac156caec77d106358f8');
    Map result= await helper.fetchWeatherInfo();
    Navigator.push(
      context,
        MaterialPageRoute(
          builder: (context)=> LocationScreen(
            jsonData: result,
          ),
        ),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
  @override
  void dispose(){
    super.dispose();
    print("dispose called");
  }
}

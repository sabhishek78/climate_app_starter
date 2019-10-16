import 'package:clima/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  void getLocation() async{
    print('Get Location called');
    Position position =await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
  }

  Future<Map> fetchWeatherInfo()async{
    Map weatherMap;
    Response response=await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    if(response.statusCode==200){
      print(response.body);
        weatherMap=jsonDecode(response.body);
      Map temperatureMap =weatherMap['main'];
      double temperature =temperatureMap['temp_max'];
      print(temperature-273.15);

    }
    return weatherMap;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
//                  child: Icon(
//                    Icons.arrow_back_ios,
//                    size: 50.0,
//                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(

                onPressed: () async{
                  getLocation();
                  Map result=await fetchWeatherInfo();

                  Navigator.push((context),
                     MaterialPageRoute(
                       builder: (context) => LocationScreen(jsonData: result,)));
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:clima/loading_screen.dart';
import 'package:clima/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:rflutter_alert/rflutter_alert.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  void getLocation() async {
    print('Get Location called');
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
  }
String cityName;
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
              TextField(
                onChanged: (text){
                  cityName=text;
                },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "EnterCity Name",

                  )
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    // Position postion =await getLocation();

                    //Map result=await fetchWeatherInfo(position);

                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen(cityName: cityName)));
                  } on Exception catch (e) {
                    Alert(
                            context: context,
                            title: "network problem",
                            desc: "Please try after some time")
                        .show();
                  }
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

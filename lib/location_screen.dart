import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LocationScreen extends StatefulWidget {
Map jsonData;

LocationScreen({this.jsonData});


  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double getTemperature(){
    Map temperatureMap=widget.jsonData['main'];
    double temperature =temperatureMap['temp_max'];
    return temperature-273.15;
  }
  String getCityName(){
    return widget.jsonData['name'];
  }
  @override
  Widget build(BuildContext context) {
    widget.jsonData;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context); //go back
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${getTemperature()}°',
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 60.0,
                      ),
                    ),
                    Text(
                      '☀️',
                      style: TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in ${getCityName()}!",
                  textAlign: TextAlign.right,
                  style:  TextStyle(
                    fontFamily: 'Spartan MB',
                    fontSize: 60.0,
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

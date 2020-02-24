import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getLocationData() async {
    var data = await WeatherModel().getLocationWeather();
//    print('asdasdasdasdkaoskdpas');
//    print(data);
//
//    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
//    print(geolocationStatus);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_forcast/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      
    });
    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WeatherScreen())));
    return Stack(children: [
      Positioned(
        bottom: MediaQuery.of(context).size.height / 1.8,
        child: Image.network(
            "https://media.istockphoto.com/id/477110708/photo/weather-forecast.jpg?b=1&s=170667a&w=0&k=20&c=cJDnRfarWTRVrTRGBv82aQUYmkgZp3FTCSLKLXdrcCU="),
      ),
      Positioned(
        bottom: 0,
        child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent),
      ),
      Scaffold(
          backgroundColor: Colors.black54,
          body: SingleChildScrollView(
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 400,
                          ),
                          Text(
                            "WEATHER APP",
                            style: GoogleFonts.goudyBookletter1911(
                                fontSize: 50, color: Colors.white),
                          ),
                        ],
                      )
                  )
              )
          )
      )
    ]);
  }
}

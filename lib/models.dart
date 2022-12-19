import 'dart:convert';

import 'package:flutter/cupertino.dart';



class WeatherInfo{
 final String description;
 final String icon;
 WeatherInfo({required this.description,required this.icon});
 factory WeatherInfo.fromJsom(Map<String,dynamic>json){
  final description = json["description"];
  final icon = json["icon"];
  return WeatherInfo(description: description, icon: icon);
 }
}



class TemperatureInfo{
 final double temp;
 TemperatureInfo({required this.temp});
 factory TemperatureInfo.fromJson(Map<String,dynamic>json){
  final temp=json["temp"];
  return TemperatureInfo(temp: temp);

 }
}




class WeatherResponse{
 final String name;
 final TemperatureInfo tempInfo;
 final WeatherInfo  weatherInfo;

 WeatherResponse({required this.name,required this.tempInfo ,required this.weatherInfo});

 factory WeatherResponse.fromJson(Map<String,dynamic>json){
 final name=json["name"];

 final tempInfoJson=json["main"];
 final temInfo=TemperatureInfo.fromJson(tempInfoJson);

 final weatherInfoJson=json["weather"][0];
 final weatherInfo=WeatherInfo.fromJsom(weatherInfoJson);




 return WeatherResponse(name: name,tempInfo: temInfo,weatherInfo: weatherInfo);
 }
 }

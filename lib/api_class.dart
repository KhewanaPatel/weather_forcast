import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forcast/models.dart';

class DataService{
  Future<WeatherResponse> getWeather(String location)async{
    String url="https://api.openweathermap.org/data/2.5/weather?q=$location&appid=502ae23da394b463becceb9092f1c3d0";
    Response response= await get(Uri.parse(url));
    print(response.body);
    final json=jsonDecode(response.body);
    return WeatherResponse.fromJson(json);

  }
}
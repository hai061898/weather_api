import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/models/WeatherModel.dart';

class WeatherResponse {
  Future<WeatherModel> getWeather(String city) async {
     final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=%7Bcity");
    
    if(result.statusCode != 200) // nếu khác thì ném ra lỗi
      throw Exception();
    
    return parsedJson(result.body);// trả về kết quả 
  }
  //lấy link api 

   WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
  //lấy kết quả từ api 
  
  
}
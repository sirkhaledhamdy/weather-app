import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'f5c6216386e52fd9f61cd5225aa14bb9';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var wData = await networkHelper.getData();
    return wData;
  }

  String getWeatherIcon(int temp) {
    if (temp < 300) {
      return '๐ฉ';
    } else if (temp < 20) {
      return '๐ง';
    } else if (temp < 15) {
      return 'โ๏ธ';
    } else if (temp < 10) {
      return 'โ๏ธ';
    } else if (temp < 5) {
      return '๐ซ';
    } else if (temp == 25) {
      return 'โ๏ธ';
    } else if (temp <= 20) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wether/models/weather_response_model.dart';
import 'package:wether/screens/msgBox.dart';
import 'package:wether/screts/api.dart';

import 'exception.dart';

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;

  WeatherModel? get weather => _weather;

  bool _isloading = false;
  bool get isLoading => _isloading;

  String _error = "";
  String get error => _error;

  Future<void> fetchWeatherDataByCity(String city,context) async {
    _isloading = true;
    _error = "";


    final String apiUrl =
        "${APIEndPoints().cityUrl}${city}&appid=${APIEndPoints().apikey}${APIEndPoints().unit}";
    var uri = Uri.parse(apiUrl);
    try {


      print("apiUrl>>>> ${apiUrl}");
      print("apiUrl>ssssssssssssssssssssssss");
      final response = await http.get(uri);
        print("response.statusCode >>  ${response.statusCode}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("data >>> ${data}");

        _weather = WeatherModel.fromJson(data);
        print(_weather!.main!.feelsLike);

        notifyListeners();
      }
      else {
        dprint("response.daaaaaaaaaaaaaaaaaaa>> ${response.body }");
        final data = jsonDecode(response.body);
        errorMsg(context, data["message"].toString());
        _error = "Failed to load data";
      }
    }on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    }
    catch (e) {
      _error = "Failed to load data $e";
    } finally {
      _isloading = false;

    }
  }





}

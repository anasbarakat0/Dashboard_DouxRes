import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

final headers = {
  'Content-Type': 'application/json',
};

getAllVerCode() async {
  Dio dio = Dio();

  Response response = await dio.get('http://192.168.1.115:3000/restaurants',
      options: Options(responseType: ResponseType.json));
  return response.data;
}

creatNewRestaurant(
  String name,
  String address,
  String phoneNumber,
  String mobileNumber,
  String open,
  String close,
  String description,
  List<String> categories,
  int numberoftables,
) async {
  final uri = Uri.parse('$url/signup/resturant');
  try {
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode({
        "logo": "path/to/logo.png",
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
        "mobileNumber": mobileNumber,
        "Images": ["path/to/image1.png", "path/to/image2.png"],
        "workingHours": {"open": open, "close": close},
        "description": description,
        "categories": categories,
        "numberoftables": numberoftables
      }),
    );
      final responseBody = json.decode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
          return [true,responseBody];
        } else if (response.statusCode == 500) {
          return [false,responseBody['message']];
        } else {
          return [false,responseBody['message']];
        }
  } catch (e) {
    return '';
  }
}

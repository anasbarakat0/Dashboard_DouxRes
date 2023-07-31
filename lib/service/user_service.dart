import 'package:dio/dio.dart';

getAllVerCode() async {
  Dio dio = Dio();

  Response response = await dio.get('http://192.168.1.115:3000/restaurants',
      options: Options(responseType: ResponseType.json));
  return response.data;
}

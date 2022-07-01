import 'package:dio/dio.dart';

final kDioOptions = BaseOptions(
  baseUrl: 'https://education-erp.com/api/ClientApplication',
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  //headers: {'content-Type': 'application/json'},
);

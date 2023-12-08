import 'package:dino_diary/constants.dart';
import 'package:dio/dio.dart';

late Dio dio;

initDio() {
  BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    contentType: ApiConstants.contentType,
  );
  dio = Dio(options);
}

Exception newApiError(Response<dynamic> response) {
  return Exception('[${response.statusCode}] ${response.data.toString()}');
}

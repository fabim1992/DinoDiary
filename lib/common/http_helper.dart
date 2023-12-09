import 'package:dino_diary/constants.dart';
import 'package:dino_diary/services/backend/assist_service.dart';
import 'package:dino_diary/services/backend/auth_service.dart';
import 'package:dino_diary/services/backend/entry_service.dart';
import 'package:dino_diary/services/backend/user_service.dart';
import 'package:dio/dio.dart';

late Dio dio;
late AuthService authService;
late UserService userService;
late EntryService entryService;
late AssistService assistService;

initDio() {
  BaseOptions options = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    contentType: ApiConstants.contentType,
  );
  dio = Dio(options);
}

initServices() {
  authService = AuthService();
  userService = UserService();
  entryService = EntryService();
  assistService = AssistService();
}

Exception newApiError(Response<dynamic> response) {
  return Exception('[${response.statusCode}] ${response.data.toString()}');
}

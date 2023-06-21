import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/user_repository.dart';

class UserController extends GetxController {
  final userRepo = Get.put(UserRepository());

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return (token != null) ? token : '';
  }

  Future<String?> register(
      String name, String email, String password, String password2) async {
    final prefs = await SharedPreferences.getInstance();
    Map body = await userRepo.register(name, email, password, password2);
    print('usercont' + "${body}");
    print(body['result']);

    if (body['result'] == 'success') {
      prefs.setString(
          'token',
          body[
              'token']); //String key = body['key']; prefs.setString('key', key);
      return null;
    } else {
      return body['message'];
    }
  }

  Future<String?> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic body = await userRepo.login(email, password); // 동적 타입으로 변경

    if (body is List<dynamic>) {
      // 서버에서 List<dynamic> 형태의 응답이 반환된 경우
      // 응답에 따른 처리 로직 구현
      // 예시: 서버에서 반환된 응답이 List 형태로 전달되는 경우 에러 처리
      return "로그인에 실패하였습니다."; // 예시로 고정된 에러 메시지 반환
    } else if (body.containsKey('token')) {
      String token = body['token'];
      prefs.setString('token', token);
      return null;
    } else {
      return "로그인에 실패하였습니다.";
    }
  }
}

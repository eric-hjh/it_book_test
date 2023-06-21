import 'package:get/get.dart';

import '../shared/global.dart';

class UserRepository extends GetConnect {
  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });

    super.onInit();
  }

//Map을 dynamic으로
  Future<Map> register(
      String name, String email, String password, String password2) async {
    Response response = await post(
      "account/signup/",
      {
        'username': name,
        'email': email,
        'password': password,
        'password2': password2,
      },
    );
    print("회원가입");
    print(response.body);
    return response.body;
  }

  Future<Map> login(String email, String password1) async {
    Response response = await post(
      "account/signin/",
      {
        'username': email,
        'password': password1,
      },
    );
    print("로그인 레포" + email + password1);
    print("로그인 repo" + "${response.body}");
    return response.body;
  }
}

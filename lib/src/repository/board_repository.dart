import 'package:get/get.dart';
import 'package:it_book/src/controller/user_controller.dart';

import '../shared/global.dart';

class BoardRepository extends GetConnect {
  final userController = Get.put(UserController());

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

  //이해 안 되는 부분 알라딘 책가져오는부분
  BoardRepository() {
    _configureHttpClient();
  }

  void _configureHttpClient() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }
  //이해 안 되는 부분 끝

  Future<List?> boardIndex() async {
    Response response = await get(
      "home/bookPost/",
      headers: {'Authorization': 'Token ${await userController.getToken()}'},
    );

    return (response.statusCode == 200) ? response.body : null;
  }

  Future<Map<String, dynamic>> fetchBookInfo(String isbn) async {
    final response = await get(
      'home/barcode_bookInfo',
      query: {'ItemId': isbn},
      headers: {'Authorization': 'Token ${await userController.getToken()}'},
    );
    print(userController.getToken());

    if (response.statusCode == 200) {
      return response.body['message'];
    } else {
      throw Exception('Failed to load book info!');
    }
  }
}

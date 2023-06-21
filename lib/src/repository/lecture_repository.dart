import 'dart:convert';

import 'package:get/get.dart';

import '../controller/user_controller.dart';
import '../shared/global.dart';

class LectureRepository extends GetConnect {
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

  Future<List<dynamic>> fetchVideoList(String videoName) async {
    final response = await get(
      '${Global.API_ROOT}class/video_list',
      query: {'VideoName': videoName},
      headers: {'Authorization': 'Token ${await userController.getToken()}'},
    );
    print(response.body);

    return response.body['message'];
  }
}

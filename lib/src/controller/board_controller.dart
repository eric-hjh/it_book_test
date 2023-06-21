import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book/src/repository/board_repository.dart';

import '../model/board_model.dart';

class BoardController extends GetxController {
  final boardRepo = Get.put(BoardRepository());

  final BoardRepository _repository = BoardRepository();
  final TextEditingController isbnController = TextEditingController();
  final Rx<Map<String, dynamic>?> bookInfo = Rx<Map<String, dynamic>?>(null);
  final Rx<String?> errorMessage = Rx<String?>(null);
  final RxBool isLoading = RxBool(false);

  List boardList = [];

  Future<bool> boardIndex() async {
    List? body = await boardRepo.boardIndex();
    print("cont" + "${body}");

    if (body == null) {
      return false;
    }
    // List board = body.map(((e) => BoardModel.parse(e))).toList();
    List<BoardModel> board =
        body.map<BoardModel>((e) => BoardModel.fromJson(e)).toList();

    boardList = board;
    update();
    return true;
  }

  Future<void> fetchBookInfo() async {
    final isbn = isbnController.text;

    if (isbn.isEmpty) {
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;

    try {
      final info = await _repository.fetchBookInfo(isbn);
      bookInfo.value = info;
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    isbnController.dispose();
    super.onClose();
  }
}

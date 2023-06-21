import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/board/add/additional_info.dart';

import '../../../controller/board_controller.dart';

class BookWritePage extends StatelessWidget {
  final BoardController _controller = Get.put(BoardController());

  @override
  Widget build(BuildContext context) {
    final String? isbn = Get.arguments;
    _controller.isbnController.text = isbn ?? '';
    return Scaffold(
      appBar: AppBar(title: Text('책 등록하기')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '등록하실 책을 검색하세요.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextField(
                    controller: _controller.isbnController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 122, 122, 122),
                          width: 1.0,
                        ),
                      ),
                      hintText: _controller.isbnController.text.isEmpty
                          ? '책 이름 또는 ISBN을 입력하세요'
                          : null,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: _controller.fetchBookInfo,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Obx(() {
              if (_controller.bookInfo.value != null) {
                final info = _controller.bookInfo.value!;
                print("bw" + "${info}");
                return GestureDetector(
                  onTap: () {
                    Get.to(() => AdditionalInfo(), arguments: info);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(info['cover']),
                      SizedBox(width: 14),
                      Container(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              info['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "ISBN: ${_controller.isbnController.text}",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "저자: ${info['author']}",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "출판사: ${info['publisher']}",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (_controller.errorMessage.value != null) {
                return Text(
                  _controller.errorMessage.value!,
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}

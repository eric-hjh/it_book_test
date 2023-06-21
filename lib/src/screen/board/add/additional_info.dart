import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../home.dart';

class AdditionalInfo extends StatefulWidget {
  const AdditionalInfo({super.key});

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  List<XFile> images = [];
  List<String> imageStrings = [];
  //추가된 내용 부분 ----------------------------------------------------------------------------------
  void _saveBookInfo() async {
    // 입력된 데이터 가져오기
    if (_formKey.currentState!.validate()) {
      print(bookInfo['pubdate']);
      String title = bookInfo['title'];
      String author = bookInfo['author'];
      String publisher = bookInfo['publisher'];
      String pubdate = bookInfo['pubdate'];
      String price = bookInfo['price'];
      String description = bookInfo['description'].split('<br/>')[1];
      String state = _stateController.text; //책 상태 임시
      String summary = _summaryController.text;

      // 데이터를 Map으로 만들기
      Map data = {
        "title": title,
        "writer": author,
        "publisher": publisher,
        "pub_date": pubdate,
        "sell_price": price,
        "content": description,
        "state": state,
        "summary": summary,
        "state_image": imageStrings,
      };

      // 데이터를 서버로 전송하기
      var response =
          await http.post(Uri.parse("http://192.168.0.2:8000/home/bookPost/"),
              headers: {
                'Content-Type': 'application/json',
                'Authorization':
                    'Token 17ae7691e296ee735a4d8bf43288dcd30e479a03'
              },
              body: jsonEncode(data));

      // 서버 응답 확인
      if (response.statusCode == 200) {
        // 서버로부터 성공적인 응답을 받았을 때 수행할 로직
        print("Book information saved successfully.");
      } else {
        // 서버로부터 오류 응답을 받았을 때 수행할 로직
        print(
            "Failed to save book information. Error code: ${response.statusCode}");
      }
      Get.off(() => Home());
    }
  }

  Future<void> loadImages() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null) {
      List<String> tempImageStrings = [];
      for (int i = 0; i < pickedImages.length; i++) {
        File file = File(pickedImages[i].path);
        List<int> imageBytes = await file.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        tempImageStrings.add(base64Image);
      }
      setState(() {
        images = pickedImages;
        imageStrings = tempImageStrings;
      });
    }
  }

  Widget buildImagePreview() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 100,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Image.file(
              File(images[index].path),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  //여기까지  -----------------------------------------------------------------------------------------------

  final Map<String, dynamic> bookInfo = Get.arguments;

  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _coverUrlController = TextEditingController();

  final TextEditingController _stateController =
      TextEditingController(); //책 상태 표시 임시
  final TextEditingController _summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String pubdate = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz')
        .parse(bookInfo['pubdate'])
        .toString();
    pubdate = DateFormat('yyyy년 MM월').format(DateTime.parse(pubdate));

    return Scaffold(
      appBar: AppBar(
        title: Text('책 정보 입력'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              buildImagePreview(),
              ElevatedButton(
                onPressed: loadImages,
                child: Text('사진 업로드'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(imageStrings);
                },
                child: Text('사진 경로'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['title'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['author'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['publisher'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  pubdate,
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  bookInfo['price'],
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: Html(
                  data: bookInfo['description']
                      .split('<br/>')[1], // <br/> 이후의 내용만 표시
                  style: {
                    'body': Style(fontSize: FontSize(17.0)),
                  },
                ),
              ),
              SizedBox(height: 10),
              // 책 상태 임시
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: '책 상태',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '상태를 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _summaryController,
                decoration: InputDecoration(
                  labelText: '책 요약',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? '요약을 입력해주세요.' : null,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _saveBookInfo,
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

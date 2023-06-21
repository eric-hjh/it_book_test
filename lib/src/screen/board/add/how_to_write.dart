import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:it_book/src/screen/board/add/bw.dart';

import 'manually_enter.dart';

class HowToWrite extends StatefulWidget {
  const HowToWrite({super.key});

  @override
  State<HowToWrite> createState() => _HowToWriteState();
}

class _HowToWriteState extends State<HowToWrite> {
  String _scanBarcode = '';

  void initState() {
    super.initState();
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "책 등록",
      ),
      actions: [],
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print("how to write");
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    //새로 추가한 isbn넘기기
    Get.to(() => BookWritePage(), arguments: _scanBarcode);
  }

  Widget _bookaddWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '책 등록할 방법을 골라주세요',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () => scanBarcodeNormal(),
                child: Text('카메라로 바코드 스캔')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {
                  var createPage =
                      MaterialPageRoute(builder: (c) => BookWritePage());
                  Navigator.push(context, createPage);
                },
                child: Text('ISBN 혹은 책 이름으로 검색')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {
                  var createPage =
                      MaterialPageRoute(builder: (c) => ManuallyEnter());
                  Navigator.push(context, createPage);
                },
                child: Text('수동으로 정보 입력')),
            SizedBox(
              height: 40,
            ),
            // Text('스캔 결과 : $_scanBarcode\n', style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bookaddWidget(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ManuallyEnter extends StatefulWidget {
  const ManuallyEnter({super.key});

  @override
  State<ManuallyEnter> createState() => _ManuallyEnterState();
}

class _ManuallyEnterState extends State<ManuallyEnter> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "등록하기",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: _appbarWidget(),
        body: Form(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                '책 정보를 입력해주세요',
                style: TextStyle(fontSize: 23),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '책 이름'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "이름을 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '저자'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "저자를 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '출판사'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "출판사를 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '출판일'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "출판일을 입력해주세요";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '정가'),
                validator: (value) {
                  if (value == null || value!.trim().isEmpty) {
                    return "정가를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: () {}, child: Text('다음'))
            ],
          ),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/user/login.dart';

import 'register.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
              // key: _formkey,
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 170,
                height: 270,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/tino.png')),
                ),
              ),
              Text(
                "IT 도서 대여 중개 서비스_test",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "잇 북",
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Get.off(() => const Login());
                  },
                  child: Text('시작하기')),
            ],
          )),
        ),
      ),
    );
  }
}

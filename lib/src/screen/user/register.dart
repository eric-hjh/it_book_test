import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/user/login.dart';

import '../../controller/user_controller.dart';

final userController = Get.put(UserController());

class Register extends StatefulWidget {
  const Register({super.key});
  // const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String password2 = _password2Controller.text;
      String? message =
          await userController.register(name, email, password, password2);

      final newUser = await _authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      if (message == null) {
        Get.off(() => const Login());
      } else {
        Get.snackbar("회원가입 에러", message, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "회원가입",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '이름',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: '이름을 입력해주세요'),
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "이름을 입력해주세요";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '아이디 (이메일)',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(hintText: '아이디를 입력해주세요'),
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "아이디를 입력해주세요";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '비밀번호',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '영문, 숫자, 특수문자를 1개이상 조합하여 8자리 이상을 입력해주세요',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: '비밀번호를 입력해주세요'),
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '비밀번호 확인',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _password2Controller,
                  obscureText: true,
                  decoration: InputDecoration(hintText: '비밀번호를 다시 한번 입력해주세요'),
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "비밀번호를 입력해주세요";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(45),
                    ),
                    onPressed: submit,
                    child: Text('가입하기'))
              ],
            )),
          ),
        ),
      ),
    );
  }
}

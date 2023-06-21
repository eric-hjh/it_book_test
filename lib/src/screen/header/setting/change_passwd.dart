import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChangePasswd extends StatefulWidget {
  const ChangePasswd({super.key});

  @override
  State<ChangePasswd> createState() => _ChangePasswdState();
}

class _ChangePasswdState extends State<ChangePasswd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("비밀번호 변경"),
      ),
    );
  }
}

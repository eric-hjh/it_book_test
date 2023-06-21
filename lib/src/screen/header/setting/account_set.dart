import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountSet extends StatefulWidget {
  const AccountSet({super.key});

  @override
  State<AccountSet> createState() => _AccountSetState();
}

class _AccountSetState extends State<AccountSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("계정 정보 설정"),
      ),
    );
  }
}

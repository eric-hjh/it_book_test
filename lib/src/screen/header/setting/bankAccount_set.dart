import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BankAccountSet extends StatefulWidget {
  const BankAccountSet({super.key});

  @override
  State<BankAccountSet> createState() => _BankAccountSetState();
}

class _BankAccountSetState extends State<BankAccountSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("계좌 설정"),
      ),
    );
  }
}

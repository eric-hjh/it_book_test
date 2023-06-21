import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KeywordSet extends StatefulWidget {
  const KeywordSet({super.key});

  @override
  State<KeywordSet> createState() => _KeywordSetState();
}

class _KeywordSetState extends State<KeywordSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("키워드 알림 관리"),
      ),
    );
  }
}

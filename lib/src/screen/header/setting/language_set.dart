import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LanguageSet extends StatefulWidget {
  const LanguageSet({super.key});

  @override
  State<LanguageSet> createState() => _LanguageSetState();
}

class _LanguageSetState extends State<LanguageSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("언어 설정"),
      ),
    );
  }
}

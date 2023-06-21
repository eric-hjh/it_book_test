import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Find extends StatefulWidget {
  const Find({super.key});

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "",
      ),
      actions: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbarWidget(),
        body: Center(
          child: Text(
            "id / pw 찾는 페이지",
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}

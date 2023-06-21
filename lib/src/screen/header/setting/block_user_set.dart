import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BlockUserSet extends StatefulWidget {
  const BlockUserSet({super.key});

  @override
  State<BlockUserSet> createState() => _BlockUserSetState();
}

class _BlockUserSetState extends State<BlockUserSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("차단 사용자 설정"),
      ),
    );
  }
}

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';
import 'package:it_book/src/screen/user/first.dart';
import 'package:it_book/src/screen/user/login.dart';

import 'screen/home.dart';

class ItBook extends StatelessWidget {
  String? token;
  ItBook(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null) ? const First() : const Home(),
    );
  }
}

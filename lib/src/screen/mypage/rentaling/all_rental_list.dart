import 'package:flutter/material.dart';

class AllRentalList extends StatelessWidget {
  const AllRentalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("대여중인 도서"),
      ),
    );
  }
}

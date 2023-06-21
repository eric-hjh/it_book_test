import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'item3.dart';

class Major extends StatefulWidget {
  const Major({super.key});

  @override
  State<Major> createState() => _MajorState();
}

class _MajorState extends State<Major> {
  final List<String> _valueList = [
    '소프트웨어 공학',
    '컴퓨터',
    '경영',
    '게임 공학',
  ];
  String _selectedValue = '소프트웨어 공학';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            DropdownButton(
              value: _selectedValue,
              items: _valueList.map((value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
            Container(
              height: 1.0,
              width: 500.0,
              color: Color.fromARGB(255, 115, 115, 115),
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  width: 80,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "1학년",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "2학년",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "3학년",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  width: 80,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "4학년",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            Container(
              height: 1.0,
              width: 500.0,
              color: Color.fromARGB(255, 116, 115, 115),
            ),
            FeedItem3(),
            Container(
              height: 1.0,
              width: 500.0,
              color: Color.fromARGB(255, 116, 115, 115),
            ),
          ],
        ),
      ),
    );
  }
}

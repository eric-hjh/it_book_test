import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/board/board.dart';
import 'package:it_book/src/screen/header/setting.dart';

import 'chat/chat.dart';
import 'header/noti.dart';
import 'header/search.dart';
import 'lecture/lecture.dart';
import 'major/major.dart';
import 'mypage/mypage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static var namea = Get.arguments;
  // final String namea = Get.arguments;

  late int _currentPageIndex;

  void initState() {
    super.initState();
    _currentPageIndex = 2;
  }

  final List<Widget> _widgetOptions = <Widget>[
    Major(),
    Lecture(),
    Board(),
    Chat(),
    MyPage(),
  ]; // 5개의 페이지를 연결할 예정이므로 5개의 페이지를 여기서 지정해준다. 탭 레이아웃은 5개.

  void _onItemTapped(int index) {
    // 탭을 클릭했을때 지정한 페이지로 이동
    print(index);
    print(namea);
    setState(() {
      _currentPageIndex = index;
    });
  }

  Widget _bottomNavigationBarwidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: _currentPageIndex, // 지정 인덱스로 이동
      selectedFontSize: 12,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.menu_book),
            ),
            label: "전공"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.smart_display),
            ),
            label: "강의"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home),
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.question_answer),
            ),
            label: "채팅"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
            label: "마이 페이지"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: _widgetOptions.elementAt(_currentPageIndex),
      ),
      bottomNavigationBar: _bottomNavigationBarwidget(),
    );
  }

  AppBar _buildAppBar() {
    switch (_currentPageIndex) {
      case 0:
        return AppBar(
            title: Text('IT-Book_TEST'),
            automaticallyImplyLeading: false,
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {
                    var createPage =
                        MaterialPageRoute(builder: (c) => Search());
                    Navigator.push(context, createPage);
                  },
                  icon: Icon(Icons.search)),
            ]);
      case 1:
        return AppBar(
          title: Text('IT-Book-TEST'),
          automaticallyImplyLeading: false,
          centerTitle: false,
        );
      case 2:
        return AppBar(
          title: Text('IT-Book-TEST'),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  var createPage = MaterialPageRoute(builder: (c) => Search());
                  Navigator.push(context, createPage);
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.to(() => const Noti());
                },
                icon: Icon(Icons.notifications_active)),
          ],
        );
      case 3:
        return AppBar(
          centerTitle: false,
          title: Text('IT-Book'),
          automaticallyImplyLeading: false,
        );
      case 4:
        return AppBar(
          title: Text('IT-Book'),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  var createPage = MaterialPageRoute(builder: (c) => Setting());
                  Navigator.push(context, createPage);
                },
                icon: Icon(Icons.settings))
          ],
        );
      default:
        return AppBar(
          title: Text('Unknown'),
        );
    }
  }
}

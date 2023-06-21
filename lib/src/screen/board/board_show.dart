import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:it_book/src/model/board_model.dart';
import 'package:it_book/src/screen/chat/chatting/chatscreen.dart';
import 'package:intl/intl.dart';

import '../../controller/board_controller.dart';

final feedController = Get.put(BoardController());

class BoardShow extends StatefulWidget {
  final BoardModel board;
  const BoardShow(this.board, {super.key});

  @override
  State<BoardShow> createState() => _BoardShowState();
}

class _BoardShowState extends State<BoardShow> {
  List imageList = [
    {"id": 1, "image_path": 'assets/1.png'},
    {"id": 2, "image_path": 'assets/2.png'},
    {"id": 3, "image_path": 'assets/3.png'}
  ];

  final CarouselController _controller = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("hits?" + "${widget.board.hits}");
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _slider(),
          SizedBox(
            height: 13,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: _buildPost(),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }

  Text _buildPostDate() {
    DateFormat inputFormat = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'");
    DateFormat outputFormat = DateFormat("yyyy년 MM월");
    DateTime dateTime = inputFormat.parse(widget.board.pubDate!);
    String formattedDate = outputFormat.format(dateTime);
    return Text(
      '출판일: $formattedDate',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 350,
          child: Text(
            '${widget.board.title}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          '작성자: ${widget.board.writer}',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 3.0),
        Text(
          '출판사: ${widget.board.publisher}',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 3.0),
        _buildPostDate(),
        SizedBox(height: 3.0),
        Text(
          '원 가격 : ${widget.board.sellPrice}원',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 3.0),
        Container(
          width: 350,
          child: Text(
            '책 소개 : ${widget.board.content}',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          '게시물 내용',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          '상태 : ${widget.board.state}',
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          '요약 : ${widget.board.summary}',
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          '태그 : ${widget.board.tags}',
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          '조횟수 : ${widget.board.hits}',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  bool _isLiked = false;

  Widget _bottomBarWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
      height: 120,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
              final snackBar = SnackBar(
                content: Text(_isLiked ? '관심목록에 추가됐어요.' : '관심목록에서 제거됐어요.'),
                duration: const Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.blue : null,
              size: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            height: 40,
            width: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ChatScreen());
                  },
                  child: Text('채팅하기'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _slider() {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['image_path'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: false,
              aspectRatio: 1,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.blue
                          : Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

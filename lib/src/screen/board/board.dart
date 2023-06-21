import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/board_controller.dart';
import '../../widget/my_list_board.dart';
import '../user/register.dart';
import 'add/how_to_write.dart';

class Board extends StatefulWidget {
  const Board({super.key});
  // const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final boardController = Get.put(BoardController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    bool result = await boardController.boardIndex();
    // if (!result) {
    //   Get.off(const Register());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const HowToWrite());
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<BoardController>(builder: (c) {
        return ListView.separated(
          itemBuilder: (context, index) => MyListBoard(c.boardList[index]),
          separatorBuilder: (context, index) => Divider(),
          itemCount: c.boardList.length,
        );
      }),
    );
  }
}

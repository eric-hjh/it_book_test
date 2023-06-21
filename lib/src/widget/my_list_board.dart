import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/board_model.dart';
import '../screen/board/board_show.dart';

class MyListBoard extends StatelessWidget {
  final BoardModel board;
  const MyListBoard(this.board, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BoardShow(
              board,
            ));
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BookProf(),
                // Container(
                //   width: 80,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: NetworkImage(board.state_image),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                            '${board.title}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('저자 : ${board.writer}'),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('출판 : ${board.publisher}'),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1.0,
              width: 500.0,
              color: const Color.fromARGB(255, 236, 235, 235),
            ),
          ],
        ),
      ),
    );
  }

  // Widget imageView() {
  //   if (feed.imageId == null) return const SizedBox();
  //   return Image.network(
  //     "${Global.API_ROOT}/file/${feed.imageId}",
  //     height: 100,
  //   );
  // }
}

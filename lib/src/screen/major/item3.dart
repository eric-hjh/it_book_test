import 'package:flutter/material.dart';
import 'package:it_book/src/widget/book_prof.dart';

class FeedItem3 extends StatelessWidget {
  const FeedItem3({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const FeedShow()),
      //   );
      // },
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 100,
              child: Text("전공 책         이미지"),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      '운영체제(8편)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('저자 : William Stallings'),
                SizedBox(
                  height: 5,
                ),
                Text('출판 : 프로텍미디어'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:it_book/src/screen/chat/chatroom.dart';
import 'package:it_book/src/widget/profile.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var createPage = MaterialPageRoute(builder: (c) => ChatRoom());
        Navigator.push(context, createPage);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/tino.png')),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "티노",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text("1주일전",
                              style: const TextStyle(color: Colors.grey))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text('도서 대여 공유 서비스 잇 북에 오신걸 환영합니다!'),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: 500.0,
            color: Color.fromARGB(255, 236, 235, 235),
          )
        ],
      ),
    );
  }
}

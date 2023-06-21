import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:it_book/src/screen/user/login.dart';

import 'setting/account_set.dart';
import 'setting/announcement.dart';
import 'setting/bankAccount_set.dart';
import 'setting/block_user_set.dart';
import 'setting/change_passwd.dart';
import 'setting/keyword_set.dart';
import 'setting/language_set.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 30, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "계정 설정",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOpt(context, "계정 정보 관리", 1),
            buildAccountOpt(context, "차단 사용자 관리", 2),
            buildAccountOpt(context, "비밀번호 변경", 3),
            buildAccountOpt(context, "계좌 설정", 4),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "알림 설정",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptRow('모든 알림 표시', true),
            buildNotificationOptRow('방해금시 시간 설정', false),
            SizedBox(
              height: 15,
            ),
            buildNotificationOptRow('채팅 알림', true),
            SizedBox(
              height: 15,
            ),
            buildNotificationOptRow('키워드 알림', true),
            buildAccountOpt(context, "키워드 알림 관리", 5),
            SizedBox(
              height: 15,
            ),
            buildNotificationOptRow('이벤트 및 혜택 알림', true),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.help_outline,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "기타 설정",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOpt(context, "공지사항", 6),
            buildAccountOpt(context, "언어 설정", 7),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Get.off(const Login());
                },
                child: Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800]),
        ),
        Transform.scale(
          scale: 0.9,
          child: CupertinoSwitch(
            activeColor: Colors.black,
            value: isActive,
            onChanged: (bool value) {
              setState(() {
                isActive = value;
              });
            },
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOpt(
      BuildContext context, String title, int numb) {
    return GestureDetector(
      onTap: () {
        navigateToPageBasedOnCondition(numb);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  void navigateToPageBasedOnCondition(int condition) {
    if (condition == 1) {
      Get.to(() => AccountSet());
      print(1);
    } else if (condition == 2) {
      Get.to(() => BlockUserSet());
      print(2);
    } else if (condition == 3) {
      Get.to(() => ChangePasswd());
      print(3);
    } else if (condition == 4) {
      Get.to(() => BankAccountSet());
      print(4);
    } else if (condition == 5) {
      Get.to(() => KeywordSet());
      print(5);
    } else if (condition == 6) {
      Get.to(() => Announce());
      print(6);
    } else if (condition == 7) {
      Get.to(() => LanguageSet());
      print(7);
    }
  }
}

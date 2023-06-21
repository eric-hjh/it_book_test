import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); // await
  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');
  runApp(ItBook(null));
}

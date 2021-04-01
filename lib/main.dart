import 'file:///C:/Users/Durotimi/FlutterProjects/book_app/lib/screens/splash.dart';
import 'package:book_app/screens/auth/login.dart';
import 'package:book_app/screens/auth/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

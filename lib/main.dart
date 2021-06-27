import 'file:///C:/Users/Durotimi/FlutterProjects/book_app/lib/screens/splash.dart';
import 'package:book_app/viewmodels/books_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

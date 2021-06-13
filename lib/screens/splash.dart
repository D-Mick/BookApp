import 'package:book_app/screens/home/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'walkthrough/on_boarding_page.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future<bool> isLoggedIn() async {
    var x = FirebaseAuth.instance;
    if(await x.currentUser() != null) {
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.data == true) {
              return  HomePage();
            } else {
              return OnBoardingPage();
            }
          }
            return Center(
              child: Lottie.asset('assets/lottie/splash.json'),
            );

        },
      ),
    );
  }
}

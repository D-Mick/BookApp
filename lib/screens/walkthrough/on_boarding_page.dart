import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/walkthrough/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

String text1 = 'This is the app that allows you to discover and\nread ebooks and magazines';
String text2 = 'Borrow and read free books,\naudiobooks, and magazines from\nyour Library using your phone or\ntablet.its easy to get.';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              FadeAnimation(1,Lottie.asset('assets/lottie/screen.json')),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(1.2,Text(
                'Hello',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                ),
              )),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(1.2,Text(
                text1,
                textAlign: TextAlign.center,
              )),
              SizedBox(height: 50,),
              FadeAnimation(1.4, MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondPage()));
                },
                color: Color(0xff2c2d37),
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 110
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
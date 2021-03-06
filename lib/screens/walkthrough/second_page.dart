import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/auth/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../home/bottomNavigation.dart';
import 'on_boarding_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              FadeAnimation(1, Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome())),
                    child: Text(
                      'SkIP',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 120,
              ),
              Expanded(
                child: FadeAnimation(1, Center(
                  child: Lottie.asset(
                    'assets/lottie/secondScreen.json',
                  ),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              FadeAnimation(1.2,Text(
                "Meet",
                style: TextStyle(
                  fontSize: 30,
                ),
              )),
              SizedBox(
                height: 5,
              ),
              FadeAnimation(1.2, Text(
                'Book Library',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: FadeAnimation(1.4, Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text2,
                      style: TextStyle(
                        height: 1.4
                      ),
                    ),
                    Hero(
                      tag: 'button',
                      child: MaterialButton(
                        minWidth: 50,
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcome()));
                        },
                        color: Color(0xff2c2d37),
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.chevron_right,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

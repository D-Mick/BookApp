import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/auth/login.dart';
import 'package:book_app/screens/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FadeAnimation(1, Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.2, Text(
                    'Automatic identity verification which enables you to verify your identity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700
                    ),
                  )),
                ],
              ),
              FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/welcome.png')
                  )
                ),
              )),
              Column(
                children: [
                  FadeAnimation(1.5, MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 110
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color(0xff2c2d37),
                      )
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2c2d37),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.5, MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
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
                      'Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

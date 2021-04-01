import 'package:book_app/animations/fadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    FadeAnimation(1, Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )),
                    FadeAnimation(1.2, Text(
                      'Login to your account',
                      style: TextStyle(
                          fontSize: 15,
                         color: Colors.grey.shade700
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      FadeAnimation(1.2, Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey.shade100
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            fillColor: Colors.grey.shade700,
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(1.2, Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey.shade100
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            fillColor: Colors.grey,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.4, MaterialButton(
                  onPressed: () {
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
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                )),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(1.5, Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Don't have an account yet?"
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )),
                FadeAnimation(1.2, Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/login.png'),
                        fit: BoxFit.cover
                      )
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

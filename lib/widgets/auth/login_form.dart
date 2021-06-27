import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/auth/register.dart';
import 'package:book_app/screens/home/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _auth = FirebaseAuth.instance;
  var _email = '';
  var _password = '';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            fillColor: Colors.grey.shade700,
                          ),
                          key: ValueKey('Email'),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value){
                            _email = value;
                          },
                        ),
                      ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(1.2, Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.grey.shade100
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            fillColor: Colors.grey,
                          ),
                          obscureText: true,
                          onChanged: (value){
                            _password = value;
                          },
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(1.4, MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    FocusScope.of(context).unfocus();
                      try{
                        final user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
                        if(user != null){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } on PlatformException catch (e){
                        var message = 'An error occurred, please check your credentials!';
                        if (e.message != null) {
                          message = e.message;
                        }
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            backgroundColor: Theme.of(context).errorColor,
                          ),
                        );
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        print(e);
                        setState(() {
                          showSpinner = false;
                        });
                      }
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
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Register()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),
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

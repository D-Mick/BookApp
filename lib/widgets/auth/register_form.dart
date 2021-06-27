import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/auth/login.dart';
import 'package:book_app/screens/home/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var _firstName = '';
  var _lastName = '';
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(1, Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      )),
                      FadeAnimation(1.2, Text(
                        "Create an account, it's free",
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
                  FadeAnimation(1.2, Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.shade100
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                              fillColor: Colors.grey.shade700,
                            ),
                            key: ValueKey('FirstName'),
                            onChanged: (value){
                              _firstName = value;
                              print(_firstName);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey.shade100
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Last Name',
                              fillColor: Colors.grey.shade700,
                            ),
                            key: ValueKey('LastName'),
                            onChanged: (value){
                              _lastName = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
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
                              validator: (value){
                                if(value.isEmpty || !value.contains('@')){
                                  return'Please enter a valid email address!';
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (value){
                                _email = value;
                              },
                            onChanged: (value){
                              _email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
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
                              validator: (value){
                                if(value.isEmpty || value.length < 7){
                                  return 'Password can\t be empty and must at least have 7 characters';
                                }else{
                                  return null;
                                }
                              },
                            onChanged: (value){
                              _password = value;
                            },
                            onSaved: (value){
                              _password = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.5, MaterialButton(
                    onPressed: () async{
                      setState(() {
                        showSpinner = true;
                      });
                      final isValid = _formKey.currentState.validate();
                      FocusScope.of(context).unfocus();
                      if(isValid){
                        _formKey.currentState.save();
                      }
                      try{
                        UserCredential authResult;
                        authResult = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                        await _firestore.collection('users').doc(authResult.user.uid).set({
                          'firstname':_firstName,
                          'lastname' : _lastName,
                          'uid' : authResult.user.uid,
                        });
                        if(authResult.user != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      }on PlatformException catch (e) {
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
                      }catch (e) {
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
                      'Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(1.2, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Already have an account?"
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

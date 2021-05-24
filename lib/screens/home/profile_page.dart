import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formkey = GlobalKey<FormState>();
  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String firstname;
  String lastname;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        await _fireStore
            .collection('users')
            .document(user.uid)
            .get()
            .then((ds) {
          firstname = ds.data['firstname'];
          lastname = ds.data['lastname'];
        });
        print(firstname);
        print(lastname);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              MaterialButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                color: Colors.white,
                elevation: 0,
                child: Text(
                  'Log out',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/image/login.png'),
                radius: 75,
              ),
              SizedBox(
                height: 15.0,
              ),
              // Text(
              //   'Micheal Johnson',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 32.0,
              //     fontWeight: FontWeight.bold
              //   ),
              // ),
              FutureBuilder(
                future: _getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Text('Loading data....Please wait');
                  return Text(
                    "$firstname $lastname",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey.shade100),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          fillColor: Colors.grey,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey.shade100),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          fillColor: Colors.grey,
                        ),
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password can\t be empty and must at least have 7 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      color: Color(0xff2c2d37),
                      padding: EdgeInsets.symmetric(
                        horizontal: 110,
                        vertical: 20,
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        'Update',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

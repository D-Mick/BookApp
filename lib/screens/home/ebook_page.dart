import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EbookPage extends StatefulWidget {
  @override
  _EbookPageState createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String firstname = "john";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }
  _getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser();
      if (loggedInUser != null) {
        var ds = await _fireStore
            .collection('users')
            .document(loggedInUser.uid)
            .get();
        firstname = ds.data['firstname'];
        print(firstname);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              FutureBuilder(
                future: _getCurrentUser(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done)
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hey $firstname 👋',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/image/login.png'),
                            radius: 25,
                          )
                        ],
                      ),
                    );

                  return Text('Loading data....Please wait');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

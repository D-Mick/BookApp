import 'package:after_layout/after_layout.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:book_app/widgets/homePage/home_page_first_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with AfterLayoutMixin{
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String firstname = "john";

  Widget _build(HomePageViewModel hpvm) {
    switch (hpvm.loadingState) {
      case LoadingState.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingState.empty:
        return Center(
          child: Text(
            'No Result Found',
          ),
        );
      case LoadingState.completed:
        return HomePageFirstWidget();
    }
  }

  _getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      if (loggedInUser != null) {
        var ds =
            await _fireStore.collection('users').doc(loggedInUser.uid).get();
        firstname = ds.data()['firstname'];
        print(firstname);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HomePageViewModel>(
          builder: (context, model, _) {
            return SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: _getCurrentUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done)
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hey $firstname 👋',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25),
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/image/login.png'),
                                  radius: 25,
                                )
                              ],
                            ),
                          );

                        return Text('Loading data....Please wait');
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _build(model),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).popularBooks();
  }
}

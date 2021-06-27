import 'package:book_app/Model/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AudioBookPage extends StatefulWidget {
  @override
  _AudioBookPageState createState() => _AudioBookPageState();
}

class _AudioBookPageState extends State<AudioBookPage> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String firstname = "john";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser;
      if (loggedInUser != null) {
        var ds = await _fireStore
            .collection('users')
            .doc(loggedInUser.uid)
            .get();
        firstname = ds.data()['firstname'];
        print(firstname);
      }
    } catch (e) {
      print(e);
    }
  }

  // Future<List<Data>> getAllData() async {
  //   var api = 'https://jsonplaceholder.typicode.com/photos';
  //   var data = await http.get();
  //
  //   var jsonData = json.decode(data.body);
  //   List<Data> listof = [];
  //
  //   for (var i in jsonData) {
  //     Data data = Data(i['id'], i['title'], i['url'], i['thumbnailUrl']);
  //     listof.add(data);
  //   }
  //
  //   return listof;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // FutureBuilder(
            //   future: _getCurrentUser(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done)
            //       return Padding(
            //         padding: const EdgeInsets.all(15.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               'Hey $firstname 👋',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, fontSize: 25),
            //             ),
            //             CircleAvatar(
            //               backgroundImage: AssetImage('assets/image/login.png'),
            //               radius: 25,
            //             )
            //           ],
            //         ),
            //       );
            //
            //     return Text('Loading data....Please wait');
            //   },
            // ),
            // Expanded(
            //   child: Container(
            //     margin: EdgeInsets.all(10.0),
            //     child: FutureBuilder(
            //       future: getAllData(),
            //       builder: (BuildContext c,
            //           AsyncSnapshot snapshot,) {
            //         if (snapshot.data == null) {
            //           return Center(
            //             child: Text("Loading Data....."),
            //           );
            //         } else {
            //           return ListView.builder(
            //             itemCount: snapshot.data.length,
            //             scrollDirection: Axis.vertical,
            //             itemBuilder: (BuildContext c, int index) {
            //               return Container(
            //                 margin: EdgeInsets.all(7.0),
            //                 padding: EdgeInsets.symmetric(
            //                   vertical: 10,
            //                   horizontal: 10,
            //                 ),
            //                 decoration: BoxDecoration(
            //                   color: Colors.grey.shade300,
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Image.network(
            //                       snapshot.data[index].url,
            //                       height: 170,
            //                       width: 170,
            //                       fit: BoxFit.fill,
            //                     ),
            //                     Expanded(
            //                         child: Container(
            //                           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //                           child: Column(
            //                             mainAxisAlignment: MainAxisAlignment
            //                                 .start,
            //                             crossAxisAlignment: CrossAxisAlignment
            //                                 .start,
            //                             children: [
            //                               Text(
            //                                 snapshot.data[index].title,
            //                                 maxLines: 1,
            //                                 style: TextStyle(
            //                                     color: Colors.orange),
            //                               ),
            //                               Text(
            //                                 'author',
            //                                 style: TextStyle(color: Colors.black,
            //                                     fontSize: 20.0),
            //                               ),
            //                               Text(
            //                                 'description',
            //                                 style: TextStyle(color: Colors.black,
            //                                     fontSize: 20.0),
            //                               ),
            //                               MaterialButton(
            //                                 color: Color(0xff2c2d37),
            //                                 onPressed: () {},
            //                                 shape: RoundedRectangleBorder(
            //                                   borderRadius: BorderRadius.circular(20.0),
            //                                 ),
            //                                 child: Text(
            //                                   'Preview',
            //                                   style: TextStyle(
            //                                       color: Colors.white, fontWeight: FontWeight.bold),
            //                                 ),
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             },
            //           );
            //         }
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

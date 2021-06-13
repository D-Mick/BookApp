import 'package:book_app/Model/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class AudioBookPage extends StatefulWidget {
  @override
  _AudioBookPageState createState() => _AudioBookPageState();
}

class _AudioBookPageState extends State<AudioBookPage> {

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

  Future<List<Data>> getAllData() async {
    var api = 'https://jsonplaceholder.typicode.com/photos';
    var data = await http.get(api);

    var jsonData = json.decode(data.body);
    List<Data> listof = [];

    for (var i in jsonData) {
      Data data = Data(i['id'], i['title'], i['url'], i['thumbnailUrl']);
      listof.add(data);
    }

    return listof;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 250.0,
                    child: FutureBuilder(
                      future: getAllData(),
                      builder: (BuildContext c, AsyncSnapshot snapshot,) {
                        if (snapshot.data == null) {
                          return Center(
                            child: Text("Loading Data....."),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext c, int index) {
                              return Card(
                                elevation: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      snapshot.data[index].url,
                                      height: 150.0,
                                      width: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      height: 50.0,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Text(snapshot.data[index].id.toString()),
                                            foregroundColor: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 6.0,
                                          ),
                                          Container(
                                            width: 80.0,
                                            child: Text(snapshot.data[index].title, maxLines: 1, style: TextStyle(color: Colors.orange),),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),

                  // SizedBox(
                  //   height: 7.0,
                  // ),
                  //
                  // Container(
                  //   margin: EdgeInsets.all(10.0),
                  //   height: MediaQuery.of(context).size.height,
                  //   child: FutureBuilder(
                  //     future: getAllData(),
                  //     builder: (BuildContext c, AsyncSnapshot snapshot){
                  //       if(snapshot.data == null){
                  //         return Center(
                  //           child: Text('Loading data....'),
                  //         );
                  //       }else{
                  //         return ListView.builder(
                  //           itemCount: snapshot.data.length,
                  //           itemBuilder: (BuildContext c, int index){
                  //             return Card(
                  //               elevation: 7.0,
                  //               child: Container(
                  //                 height: 80.0,
                  //                 child: InkWell(
                  //                   onTap: (){
                  //
                  //                   },
                  //                   child: Row(
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Image.network(
                  //                           snapshot.data[index].thumbnailUrl,
                  //                           height: 100.0,
                  //                           fit: BoxFit.cover,
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         width: 6.0,
                  //                       ),
                  //                       Expanded(
                  //                           flex: 2,
                  //                           child: Text(
                  //                             snapshot.data[index].title,
                  //                             maxLines: 2,
                  //                             style: TextStyle(
                  //                                 fontSize: 16.0
                  //                             ),
                  //                           )
                  //                       ),
                  //                       Expanded(
                  //                         flex: 1,
                  //                         child: Align(
                  //                           alignment: Alignment.center,
                  //                           child: CircleAvatar(
                  //                             child: Text(
                  //                               snapshot.data[index].id.toString(),
                  //                             ),
                  //                             backgroundColor: Colors.red,
                  //                             foregroundColor: Colors.white,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }
                  //     },
                  //   ),
                  // )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

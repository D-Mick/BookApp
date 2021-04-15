import 'package:flutter/material.dart';

class EbookPage extends StatefulWidget {
  @override
  _EbookPageState createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hey Micheal 👋',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(padding:
            EdgeInsets.only(
                left: 25,
                top: 25),
              child: Column(
                children: [
                  Text(
                    'Hi, Micheal',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                    ),
                  ),
                  Text(
                    'Discover New Books',
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Books'),
      //   backgroundColor: Color(0xffE46F41),
      // ),
    );
  }
}

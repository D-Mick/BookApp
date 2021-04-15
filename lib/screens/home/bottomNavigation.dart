import 'package:book_app/animations/fadeAnimation.dart';
import 'package:book_app/screens/home/home_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const colorBlack = Colors.black;
const colorIconInactive = Colors.grey;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
                color: Colors.white,
                child: Ebook(),
                // child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Hey Micheal 👋',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 25),
                //       ),
                //       CircleAvatar(
                //         backgroundImage: AssetImage('assets/image/login.png'),
                //         radius: 25,
                //       )
                //     ])
            ),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        animationDuration: Duration(milliseconds: 300),
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              inactiveColor: colorIconInactive,
              activeColor: colorBlack),
          BottomNavyBarItem(
            title: Text('E-books'),
            icon: Icon(Icons.book),
            activeColor: colorBlack,
            inactiveColor: colorIconInactive,
          ),
          BottomNavyBarItem(
            title: Text('Audiobooks'),
            icon: Icon(Icons.audiotrack),
            activeColor: colorBlack,
            inactiveColor: colorIconInactive,
          ),
          BottomNavyBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
            activeColor: colorBlack,
            inactiveColor: colorIconInactive,
          ),
        ],
      ),
    );
  }
}
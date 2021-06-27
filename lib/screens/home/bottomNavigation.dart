import 'package:book_app/screens/home/audiobook_page.dart';
import 'package:book_app/screens/home/ebook_page.dart';
import 'package:book_app/screens/home/home_page.dart';
import 'package:book_app/screens/home/profile_page.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



const colorBlack = Colors.black;
const colorIconInactive = Colors.grey;

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              ChangeNotifierProvider(
                create: (_) => HomePageViewModel(),
                child: Container(
                    color: Colors.white,
                    child: HomePage(),
                ),
              ),
              Container(
                color: Colors.white,
                child: EbookPage(),
              ),
              Container(
                color: Colors.white,
                child: AudioBookPage(),
              ),
              Container(
                color: Colors.white,
                child: ProfilePage(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          animationDuration: Duration(milliseconds: 300),
          onItemSelected: (index) {
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
      ),
    );
  }
}
import 'package:book_app/animations/fadeAnimation.dart';
import 'package:flutter/material.dart';

class Ebook extends StatefulWidget {
  @override
  _EbookState createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
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

// class BottomNavItem extends StatelessWidget {
//   final Function onTap;
//   final Color color;
//   final String iconPath;
//
//   BottomNavItem({this.onTap, this.color, this.iconPath});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: EdgeInsets.all(5.0),
//           child: Image.asset(
//             '$iconPath',
//             color: color,
//           )
//         ),
//       ),
//     );
//   }
// }
//
// Expanded(
// child: Padding(
// padding: EdgeInsets.only(bottom: 0),
// child: screens[_currentPage],
// ),
// ),
// Material(
// color: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
// ),
// elevation: 13,
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
// child: Row(
// children: [
// BottomNavItem(
// color: (_currentPage == 0) ? colorBlack : colorIconInactive,
// iconPath: "assets/image/home.png",
// onTap: () => changePage(0),
// ),
// BottomNavItem(
// color: (_currentPage == 1) ? colorBlack : colorIconInactive,
// iconPath: "assets/image/home.png",
// onTap: () => changePage(1),
// ),
// BottomNavItem(
// color: (_currentPage == 1) ? colorBlack : colorIconInactive,
// iconPath: "assets/image/home.png",
// onTap: () => changePage(1),
// ),
// BottomNavItem(
// color: (_currentPage == 1) ? colorBlack : colorIconInactive,
// iconPath: "assets/image/home.png",
// onTap: () => changePage(1),
// ),
// ],
// ),
// ),
// ),

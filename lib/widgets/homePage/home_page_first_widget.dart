import 'package:book_app/Model/book.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, model, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: model.homePageBookLength,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Items subjectBook = model.homePageBooks[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                            subjectBook.volumeInfo.imageLinks.thumbnail,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              width: 100,
                              child: Text(
                                "jnjnj",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

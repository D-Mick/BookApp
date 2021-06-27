import 'package:book_app/viewmodels/books_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchEbookWidget extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BookViewModel>(builder: (context, model, _) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: TextField(
          controller: textEditingController,
          autocorrect: true,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              model.searchBooks(value);
            }
          },
          decoration: InputDecoration(
            labelText: 'Search',
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.black,),
            ),
          ),
        ),
      );
    });
  }
}

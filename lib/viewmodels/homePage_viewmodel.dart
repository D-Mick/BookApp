import 'package:book_app/Model/book.dart';
import 'package:book_app/services/book_web_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LoadingState{completed, searching, empty}

class HomePageViewModel extends ChangeNotifier{

  var loadingState = LoadingState.searching;

  List<Items> homePageBooks = [];

  //get total length of books array
  int get homePageBookLength => homePageBooks.length;

  Future<void> popularBooks() async {
    this.loadingState = LoadingState.searching;
    notifyListeners();
    List<Items> popularbooks = await BookWebServiceImpl().homePageEbook();
    this.homePageBooks = popularbooks;
    this.loadingState = this.homePageBooks.isEmpty ? LoadingState.empty : LoadingState.completed;
    notifyListeners();
  }

}
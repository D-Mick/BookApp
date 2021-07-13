import 'package:book_app/Model/book.dart';
import 'package:book_app/services/book_web_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum LoadingState{completed, searching, empty}

class HomePageViewModel extends ChangeNotifier{

  var loadingState = LoadingState.searching;

  List<Items> homePageBooks = [];
  List<Items> mathEBooks = [];
  List<Items> englishEBooks = [];

  //get total length of books array
  int get homePageBookLength => homePageBooks.length;
  //get total length of math books array
  int get mathEBookLength => mathEBooks.length;
  //get total length of english books array
  int get englishEBookLength => englishEBooks.length;

  Future<void> popularBooks() async {
    this.loadingState = LoadingState.searching;
    notifyListeners();
    List<Items> popularbooks = await BookWebServiceImpl().homePageEbook();
    this.homePageBooks = popularbooks;
    this.loadingState = this.homePageBooks.isEmpty ? LoadingState.empty : LoadingState.completed;
    notifyListeners();
  }

  Future<void> mathBooks() async {
    this.loadingState = LoadingState.searching;
    notifyListeners();
    List<Items> mathbooks = await BookWebServiceImpl().populateEbookMath();
    this.mathEBooks = mathbooks;
    notifyListeners();
    this.loadingState = this.mathEBooks.isEmpty ? LoadingState.empty : LoadingState.completed;
  }

  Future<void> englishBooks() async {
    this.loadingState = LoadingState.searching;
    notifyListeners();
    List<Items> englishbooks = await BookWebServiceImpl().populateEbookEnglish();
    this.englishEBooks = englishbooks;
    this.loadingState = this.englishEBooks.isEmpty ? LoadingState.empty : LoadingState.completed;
    notifyListeners();
  }

}
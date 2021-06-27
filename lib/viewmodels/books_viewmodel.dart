import 'package:book_app/Model/book.dart';
import 'package:book_app/services/book_web_service.dart';
import 'package:flutter/foundation.dart';

enum LoadingStatus { completed, searching, empty }

class BookViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<Items> books = [];

  //get the total length of books array
  int get bookLength => books.length;

  //search method
  Future<void> searchBooks(String query) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<Items> booksList = await BookWebServiceImpl().searchBook(query);
    this.books = booksList;
    this.loadingStatus =
        this.books.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  //populate biology books
  Future<void> biologyEbook() async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<Items> subjectList = await BookWebServiceImpl().populateEbookBiology();
    this.books = subjectList;
    this.loadingStatus = this.books.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}

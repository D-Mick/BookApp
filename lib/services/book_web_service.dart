import 'dart:convert';

import 'package:book_app/Model/book.dart';
import 'package:http/http.dart' as http;
import 'package:book_app/constant.dart';

abstract class BookWebService {
  Future<List<Items>> searchBook(String query);
  Future<List<Items>> populateEbookBiology();
  Future<List<Items>> homePageEbook();
}

class BookWebServiceImpl implements BookWebService{
  String _baseUrl = "www.googleapis.com";

  @override
  Future<List<Items>> searchBook(String query) async {
    String path = "books/v1/volumes";

    var queryParams = {
      "q": "$query",
      "filter": "free-ebooks",
      "key": "$apiKey"
    };

    Uri uri = Uri.https(_baseUrl, path, queryParams);

    try{
      var response = await http.get(uri);
      print(response.body);

      if(response.statusCode == 200){
        List books =jsonDecode(response.body)['items'];
        
        return books.map((e) => Items.fromJson(e)).toList();
      }else{
        return null;
      }
    }on Exception catch(e){
      print(e);
    }
  }

  @override
  Future<List<Items>> populateEbookBiology() async {
    String path = "books/v1/volumes";

    var queryParams = {
      "q": "biology",
      "filter": "free-ebooks",
      "key": "$apiKey"
    };

    Uri uri = Uri.https(_baseUrl, path, queryParams);

    try{

      var response = await http.get(uri);
      print(response.body);

      if(response.statusCode == 200){
        List books = jsonDecode(response.body)["items"];
        
        return books.map((e) => Items.fromJson(e)).toList();
      }else{
        return null;
      }

    } on Exception catch(e){
      print(e);
    }
  }

  @override
  Future<List<Items>> homePageEbook() async {
    String path = "books/v1/volumes";

    var queryParams = {
      "q": "chemistry",
      "filter": "free-ebooks",
      "key": "$apiKey",
    };

    Uri uri = Uri.https(_baseUrl, path, queryParams);

   try{
     var response = await http.get(uri);
     print(response.body);

     if(response.statusCode == 200){
       List homePageBooks = jsonDecode(response.body)['items'];

       return homePageBooks.map((e) => Items.fromJson(e)).toList();
     }else{
       return null;
     }
   } on Exception catch(e){
     print(e);
   }
  }
}



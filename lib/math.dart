import 'package:after_layout/after_layout.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:book_app/widgets/ebook/ebook_web_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/book.dart';
class Math extends StatefulWidget{

  @override
  _MathState createState() => _MathState();
}

class _MathState extends State<Math> with AfterLayoutMixin {


  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).mathBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomePageViewModel>(
        builder: (context, model, _){
          return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('djfjdf'),
              Container(
                width: 40,
                height: 120,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  itemCount: model.mathEBookLength,
                  itemBuilder: (context, index) {
                    Items book = model.mathEBooks[index];

                    String buildAuthors() {
                      var authors = book.volumeInfo.author;

                      if (authors.isNotEmpty) {
                        print(authors);
                        var x = "";
                        authors.forEach((element) => x += " $element");
                        return x;
                      }
                      return "";
                    }

                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                book.volumeInfo.imageLinks.smallThumbnail,
                                height: 170,
                                width: 170,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buildAuthors(),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    book.volumeInfo.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0),
                                  ),
                                  Text(
                                    book.volumeInfo.language,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0),
                                  ),
                                  MaterialButton(
                                    color: Color(0xff2c2d37),
                                    onPressed: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EbookWebPreview(items: book),
                                        ),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0),
                                    ),
                                    child: Text(
                                      'Preview',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

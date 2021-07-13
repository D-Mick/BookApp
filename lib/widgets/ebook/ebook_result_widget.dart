import 'package:book_app/Model/book.dart';
import 'package:book_app/viewmodels/books_viewmodel.dart';
import 'package:book_app/widgets/ebook/ebook_web_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EbookResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookViewModel>(
      builder: (context, model, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView.builder(
            itemCount: model.bookLength,
            itemBuilder: (context, index) {
              Items book = model.books[index];


              String buildAuthors() {

                var authors = book.volumeInfo.author;

              if(authors.isNotEmpty) {
                print(authors);
                  var x = "";
                  authors.forEach((element) => x += " $element");
                  return x;
                }
                  return "";
              }


              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              buildAuthors(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              book.volumeInfo.title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20.0),
                            ),
                            Text(
                              book.volumeInfo.language,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20.0),
                            ),
                            MaterialButton(
                              color: Color(0xff2c2d37),
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EbookWebPreview(items: book),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
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
        );
      },
    );
  }
}


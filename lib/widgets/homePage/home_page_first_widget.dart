import 'package:after_layout/after_layout.dart';
import 'package:book_app/Model/book.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:book_app/widgets/ebook/ebook_web_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFirstWidget extends StatefulWidget {
  @override
  _HomePageFirstWidgetState createState() => _HomePageFirstWidgetState();
}

class _HomePageFirstWidgetState extends State<HomePageFirstWidget> with TickerProviderStateMixin{
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              fontSize: 15,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey.shade100,
            ),
            tabs: [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Math",
              ),
              Tab(
                text: "English",
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Consumer<HomePageViewModel>(
            builder: (context, model, _) {
              return TabBarView(
                controller: tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.homePageBookLength,
                          itemBuilder: (BuildContext context, int index) {
                            Items subjectBook = model.homePageBooks[index];

                            String buildAuthors() {
                              var authors = subjectBook.volumeInfo.author;

                              if (authors.isNotEmpty) {
                                print(authors);
                                var x = "";
                                authors.forEach((element) => x += " $element");
                                return x;
                              }
                              return "";
                            }

                            return GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EbookWebPreview(items: subjectBook),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 4,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          subjectBook
                                              .volumeInfo.imageLinks.thumbnail,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 100,
                                      child: Text(
                                        buildAuthors(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Recently Added",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.homePageBookLength,
                              itemBuilder: (BuildContext context, int index) {
                                Items subjectBook = model.homePageBooks[index];
                                return InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EbookWebPreview(items: subjectBook),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 4,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(subjectBook
                                            .volumeInfo.imageLinks.thumbnail),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.homePageBookLength,
                          itemBuilder: (BuildContext context, int index) {
                            Items subjectBook = model.homePageBooks[index];
                            return InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EbookWebPreview(items: subjectBook),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      subjectBook
                                          .volumeInfo.imageLinks.thumbnail,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  //math
                  Container(
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


                  //english tab
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView.builder(
                      itemCount: model.englishEBookLength,
                      itemBuilder: (context, index) {
                        Items book = model.englishEBooks[index];

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
        ),
      ],
    );
  }

}

import 'package:book_app/Model/book.dart';
import 'package:book_app/viewmodels/homePage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageFirstWidget extends StatefulWidget {
  @override
  _HomePageFirstWidgetState createState() => _HomePageFirstWidgetState();
}

class _HomePageFirstWidgetState extends State<HomePageFirstWidget>
    with TickerProviderStateMixin {
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
                        flex: 8,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.homePageBookLength,
                          itemBuilder: (BuildContext context, int index) {
                            Items subjectBook = model.homePageBooks[index];

                            String buildAuthors() {

                              var authors = subjectBook.volumeInfo.author;

                              if(authors.isNotEmpty) {
                                print(authors);
                                var x = "";
                                authors.forEach((element) => x += " $element");
                                return x;
                              }
                              return "";
                            }

                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  Container(
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
                      Text(
                        "Recommended for you",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                          flex: 4,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.homePageBookLength,
                              itemBuilder: (BuildContext context, int index) {
                                Items subjectBook =
                                    model.homePageBooks[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(subjectBook
                                        .volumeInfo.imageLinks.thumbnail),
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
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  subjectBook.volumeInfo.imageLinks.thumbnail,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
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

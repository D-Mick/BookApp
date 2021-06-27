import 'package:book_app/viewmodels/books_viewmodel.dart';
import 'package:book_app/widgets/ebook/search_ebook_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ebook_result_widget.dart';

class EbookPageWidget extends StatefulWidget {
  @override
  _EbookPageWidgetState createState() => _EbookPageWidgetState();
}

class _EbookPageWidgetState extends State<EbookPageWidget> {

  Widget _buildList(BookViewModel bvm) {
    switch (bvm.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Center(
          child: Text("No Result Found!"),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: EbookResultWidget(),
        );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BookViewModel>(
      builder: (context, model, _){
        return Column(
          children: [
            SearchEbookWidget(),
            _buildList(model),
          ],
        );
      },
    );
  }
}

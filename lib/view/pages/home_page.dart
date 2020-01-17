import 'package:books_flutterbloc_app/repository.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_bloc.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_page_event.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_page_state.dart';
import 'package:books_flutterbloc_app/view/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = HomePageBloc(repository: Repository());

  final List<String> _categories = [
    "Android",
    "Java",
    "História",
    "Ciência",
    "python",
    "React Native",
    "Flutter",
    "Mobile"
  ];

  int _selectedindex;

  @override
  void initState() {
    super.initState();
    _selectedindex = 0;
    _bloc.add(SearchEvent(query: _categories[0]));
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(top: 40.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Browse",
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Text(
                      "Recommended",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 70.0,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: _categories.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, index) => SizedBox(width: 8.0),
                    itemBuilder: (_, index) {
                      if (index == 0)
                        return GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Chip(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                backgroundColor: index == _selectedindex
                                    ? Colors.indigoAccent
                                    : Colors.grey[300],
                                label: Text(
                                  _categories.elementAt(index),
                                  style: TextStyle(
                                      color: index == _selectedindex
                                          ? Colors.white
                                          : Colors.grey[600]),
                                ),
                              ),
                            ),
                            onTap: () => _onCategorySelected(index));
                      return GestureDetector(
                          child: Chip(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            backgroundColor: index == _selectedindex
                                ? Colors.indigo
                                : Colors.grey[300],
                            label: Text(
                              _categories.elementAt(index),
                              style: TextStyle(
                                  color: index == _selectedindex
                                      ? Colors.white
                                      : Colors.grey[600]),
                            ),
                          ),
                          onTap: () => _onCategorySelected(index));
                    }),
              ),
              BlocBuilder<HomePageBloc, HomePageSate>(
                  bloc: _bloc,
                  builder: (_, state) {
                    if (state is StateLoading)
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                    if (state is StateError)
                      return Center(
                        child: Text(state.message),
                      );

                    if (state is StateSuccess) {
                      final bookList = state.books;
                      return Expanded(
                        child: ListView.separated(
                            itemCount: bookList.length,
                            shrinkWrap: true,
                            separatorBuilder: (_, index) => Divider(
                                  color: Colors.transparent,
                                ),
                            itemBuilder: (_, index) {
                              final item = bookList.elementAt(index);
                              return BookWidget(book: item);
                            }),
                      );
                    }

                    return SizedBox.shrink();
                  })
            ],
          ),
        ));
  }

  _onCategorySelected(int index) {
    setState(() {
      _selectedindex = index;

      _bloc.add(SearchEvent(query: _categories[index]));
    });
  }
}

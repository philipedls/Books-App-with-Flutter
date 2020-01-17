import 'dart:convert' as convert;
import 'package:books_flutterbloc_app/book.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_page_state.dart';

import 'package:http/http.dart' as http;

class Repository {
  final baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future<HomePageSate> getBooks(String query) async {
    try {
      final url = "$baseUrl?q=$query";

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = BooksApiModel.fromJson(convert.jsonDecode(response.body));

        return StateSuccess(books: data.books);
      } else {
        return StateError(message: "Internet Error!");
      }
    } catch (e) {
      print(e);
      return StateError(message: "Error Unknow!");
    }
  }
}

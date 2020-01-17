import 'package:books_flutterbloc_app/book.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomePageSate extends Equatable {
  const HomePageSate();

  @override
  List<Object> get props => [];
}

class StateLoading extends HomePageSate {
  @override
  String toString() => "HomePageStateLoading";
}

class StateSuccess extends HomePageSate {
  final List<Book> books;

  const StateSuccess({@required this.books});

  @override
  String toString() => "HomePageStateSuccess";
}

class StateError extends HomePageSate {
  final String message;

  const StateError({@required this.message});

  @override
  String toString() => "HomePageStateError";
}
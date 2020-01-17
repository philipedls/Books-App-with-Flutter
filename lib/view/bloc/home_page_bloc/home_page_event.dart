import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];

}

class SearchEvent extends HomePageEvent {
  final String query;
   
  const SearchEvent({@required this.query});

  @override
  String toString() => "HomePageEvent";
}
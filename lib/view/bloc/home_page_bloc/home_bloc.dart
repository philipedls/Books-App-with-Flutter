import 'package:bloc/bloc.dart';
import 'package:books_flutterbloc_app/repository.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_page_event.dart';
import 'package:books_flutterbloc_app/view/bloc/home_page_bloc/home_page_state.dart';
import 'package:meta/meta.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageSate> {
  final Repository repository;

  HomePageBloc({@required this.repository});

  @override
  HomePageSate get initialState => StateLoading();

  @override
  Stream<HomePageSate> mapEventToState(HomePageEvent event) async* {
    if (event is SearchEvent) {
      yield StateLoading();

      var query = event.query;
      var booksResult = await repository.getBooks(query);

      yield booksResult;
    }
  }
}

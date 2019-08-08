import 'package:fish_redux/fish_redux.dart';

class SearchFiltrateState implements Cloneable<SearchFiltrateState> {

  @override
  SearchFiltrateState clone() {
    return SearchFiltrateState();
  }
}

SearchFiltrateState initState(Map<String, dynamic> args) {
  return SearchFiltrateState();
}

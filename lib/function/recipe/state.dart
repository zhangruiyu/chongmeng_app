import 'package:fish_redux/fish_redux.dart';

import 'model/recipe_entity.dart';

class RecipeState implements Cloneable<RecipeState> {
  List<RecipeData> data;

  @override
  RecipeState clone() {
    return RecipeState()..data = data;
  }
}

RecipeState initState(Map<String, dynamic> args) {
  return RecipeState();
}

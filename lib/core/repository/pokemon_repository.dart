import 'package:poke/core/model/pokemon.dart';

abstract class PokemonRepository {
  /// Call this and repository handles pagination so every call will load more pokes
  Future<List<Pokemon>> loadPokemons();
}

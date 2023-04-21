import 'package:poke/core/mapping/pokemon_mapping.dart';
import 'package:poke/core/model/pokemon.dart';
import 'package:poke/core/network/poke_api.dart';
import 'package:poke/core/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final _api = PokeApi();

  int _offset = 0;

  @override
  Future<List<Pokemon>> loadPokemons() async {
    final pokemons = await _api.fetchPokemons(offset: _offset);
    _offset += pokemons.length; // increase the offset in order to load more.
    return pokemons.map((dto) => dto.toPokemon()).toList();
  }
}

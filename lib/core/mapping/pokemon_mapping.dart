import 'package:poke/core/model/pokemon.dart';
import 'package:poke/core/network/dto/pokemon_dto.dart';
import 'package:poke/core/network/poke_api.dart';

extension Mapping on PokemonDto {
  Pokemon toPokemon() {
    final urlSplitted = url.split('/');
    // -2 because when we split by '/', the last item will be empty as link ends with /
    final int pokemonId = int.parse(urlSplitted[urlSplitted.length - 2]);
    return Pokemon(
      name: name,
      url: url,
      frontImageUrl: PokeApi.buildPokemonImageUrl(pokemonId),
    );
  }
}

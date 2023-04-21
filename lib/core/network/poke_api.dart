import 'package:dio/dio.dart';
import 'package:poke/core/network/dto/pokemon_dto.dart';
import 'package:poke/di/locator.dart';

class PokeApi {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  static String buildPokemonImageUrl(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  final _dio = locator<Dio>();

  Future<List<PokemonDto>> fetchPokemons({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        '$baseUrl/pokemon',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );
      if (response.statusCode != 200) {
        return [];
      }
      final pokemonsList = (response.data['results'] as List)
          .map((pokeJson) => PokemonDto.fromJson(pokeJson))
          .toList();
      return pokemonsList;
    } catch (e) {
      return [];
    }
  }
}

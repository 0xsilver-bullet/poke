import 'package:poke/core/model/pokemon_details.dart';
import 'package:poke/core/model/stat.dart';
import 'package:poke/core/network/dto/pokemon_details_dto.dart';

extension Mapping on PokemonDetailsDto {
  PokemonDetails toPokemonDetails() {
    return PokemonDetails(
      id: id,
      name: name,
      height: height,
      weight: weight,
      types: types,
      stats:
          stats.map((s) => Stat(name: s.name, baseState: s.baseState)).toList(),
    );
  }
}

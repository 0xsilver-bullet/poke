import 'package:poke/core/network/dto/stat_dto.dart';

class PokemonDetailsDto {
  PokemonDetailsDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        height = json['height'] * 10,
        weight = json['weight'] / 10,
        stats = (json['stats'] as List)
            .map((statJson) => StatDto.fromJson(statJson))
            .toList(),
        types = (json['types'] as List)
            .map((typeJson) => typeJson['type']['name'] as String)
            .toList();

  final int id;
  final String name;
  final int height; // in centimeters
  final double weight; // in kilograms
  final List<StatDto> stats;
  final List<String> types;
}

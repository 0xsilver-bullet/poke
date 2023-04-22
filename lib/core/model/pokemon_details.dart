import 'package:equatable/equatable.dart';
import 'package:poke/core/model/stat.dart';

class PokemonDetails extends Equatable {
  const PokemonDetails({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
  });

  final int id;
  final String name;
  final int height; // in centimeters
  final double weight; // in kilograms
  final List<Stat> stats;
  final List<String> types;

  @override
  List<Object> get props => [
        id,
        name,
        height,
        weight,
        stats,
        types,
      ];
}

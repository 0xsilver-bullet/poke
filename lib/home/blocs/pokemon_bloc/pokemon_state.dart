part of 'pokemon_bloc.dart';

@immutable
class PokemonState extends Equatable {
  const PokemonState({
    required this.pokemons,
    required this.isLoading,
  });

  final List<Pokemon> pokemons;
  final bool isLoading;

  PokemonState copyWith({
    List<Pokemon>? pokemons,
    bool? isLoading,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        pokemons,
        isLoading,
      ];
}

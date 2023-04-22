part of 'pokemon_details_bloc.dart';

abstract class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadedPartialDetailsEvent extends PokemonDetailsEvent {
  const LoadedPartialDetailsEvent(this.pokemonDetails);

  final PokemonDetails pokemonDetails;

  @override
  List<Object> get props => [pokemonDetails];
}

class FailedToLoadEvent extends PokemonDetailsEvent {}

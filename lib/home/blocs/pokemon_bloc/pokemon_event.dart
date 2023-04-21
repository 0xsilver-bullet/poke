part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent extends Equatable {
  @override
  List get props => [];
}

class LoadPokemons extends PokemonEvent {}

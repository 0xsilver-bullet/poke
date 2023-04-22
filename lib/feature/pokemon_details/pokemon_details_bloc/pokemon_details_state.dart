part of 'pokemon_details_bloc.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();

  @override
  List<Object> get props => [];
}

class LoadingPokemonDetails extends PokemonDetailsState {}

/// This is because the first api call will not be sufficient to load all the data
/// so after making the first call only part of the data will be available and we have
/// to load the other part.
class PartialDetailsLoaded extends PokemonDetailsState {
  const PartialDetailsLoaded({
    required this.pokemonDetails,
    required this.domainantColor,
  });

  final PokemonDetails pokemonDetails;
  final Color domainantColor;

  @override
  List<Object> get props => [
        pokemonDetails,
        domainantColor,
      ];
}

class FailedToLoadPokemonDetails extends PokemonDetailsState {}

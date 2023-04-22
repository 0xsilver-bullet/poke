import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:poke/core/model/pokemon.dart';
import 'package:poke/core/model/pokemon_details.dart';
import 'package:poke/core/repository/pokemon_repository.dart';
import 'package:poke/di/locator.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc(Pokemon pokemon)
      : _pokemon = pokemon,
        super(LoadingPokemonDetails()) {
    on<LoadedPartialDetailsEvent>(_handlePartialDetailsLoadedEvent);
    on<FailedToLoadEvent>(_handleFailedToLoadEvent);
    _loadPokemonDetails();
  }

  final Pokemon _pokemon;
  final _repository = locator<PokemonRepository>();

  Future<void> _loadPokemonDetails() async {
    try {
      final pokemonDetails = await _repository.loadPokemonDetails(_pokemon);
      add(LoadedPartialDetailsEvent(pokemonDetails));
    } catch (e) {
      add(FailedToLoadEvent());
    }
  }

  Future<void> _handlePartialDetailsLoadedEvent(
    LoadedPartialDetailsEvent event,
    Emitter<PokemonDetailsState> emit,
  ) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(_pokemon.frontImageUrl),
    );
    emit(
      PartialDetailsLoaded(
        pokemonDetails: event.pokemonDetails,
        domainantColor: paletteGenerator.colors.first,
      ),
    );
  }

  Future<void> _handleFailedToLoadEvent(
    FailedToLoadEvent event,
    Emitter<PokemonDetailsState> emit,
  ) async {
    emit(FailedToLoadPokemonDetails());
  }
}

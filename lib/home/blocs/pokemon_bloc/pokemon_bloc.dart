import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poke/core/model/pokemon.dart';
import 'package:poke/core/repository/pokemon_repository.dart';
import 'package:poke/di/locator.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState(pokemons: [], isLoading: false)) {
    on<LoadPokemons>(_loadPokemonsEvent);
    add(LoadPokemons());
  }

  final _pokemonRepository = locator<PokemonRepository>();

  Future<void> _loadPokemonsEvent(
    LoadPokemons event,
    Emitter<PokemonState> emit,
  ) async {
    if (state.isLoading) {
      // only load more once at a time.
      return;
    }
    emit(state.copyWith(isLoading: true));
    final pokemons = await _pokemonRepository.loadPokemons();
    final List<Pokemon> newList = [...state.pokemons, ...pokemons];
    emit(
      state.copyWith(
        pokemons: newList,
        isLoading: false,
      ),
    );
  }
}

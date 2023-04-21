import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/home/widget/pokemon_item.dart';

import '../blocs/pokemon_bloc/pokemon_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (ctx, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisExtent: 150,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: state.pokemons.length,
              itemBuilder: (ctx, index) {
                return PokemonItem(pokemon: state.pokemons[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      BlocProvider.of<PokemonBloc>(context).add(LoadPokemons());
    }
  }
}

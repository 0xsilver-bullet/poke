import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/feature/pokemon_details/screen/pokemon_details_screen.dart';

import '../blocs/pokemon_bloc/pokemon_bloc.dart';
import '../widget/pokemon_item.dart';

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
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      'assets/images/pokemons.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  expandedHeight: 200,
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (ctx, index) {
                    return PokemonItem(
                      pokemon: state.pokemons[index],
                      onClick: (pokemon) => Navigator.of(ctx)
                          .push(PokemonDetailsScreen.buildRoute(pokemon)),
                    );
                  },
                  itemCount: state.pokemons.length,
                )
              ],
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

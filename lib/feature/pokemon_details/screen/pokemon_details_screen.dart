import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/core/model/pokemon.dart';
import 'package:poke/feature/pokemon_details/widget/pokemon_info.dart';
import 'package:poke/feature/pokemon_details/widget/pokemon_stats.dart';
import 'package:poke/feature/pokemon_details/widget/rotating_ball.dart';

import '../pokemon_details_bloc/pokemon_details_bloc.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    super.key,
    required this.pokemon,
  });

  static Route buildRoute(Pokemon pokemon) => PageRouteBuilder(
        pageBuilder: (_, __, ___) => PokemonDetailsScreen(pokemon: pokemon),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonDetailsBloc(pokemon),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
        ),
        body: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
          builder: (ctx, state) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const RotatingBall(),
                      CachedNetworkImage(
                        imageUrl: pokemon.frontImageUrl,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (state is LoadingPokemonDetails)
                    const CircularProgressIndicator(),
                  if (state is PartialDetailsLoaded) ...[
                    PokemonInfo(details: state.pokemonDetails),
                    const SizedBox(height: 24),
                    PokemonStats(
                      stats: state.pokemonDetails.stats,
                      color: state.domainantColor,
                    ),
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

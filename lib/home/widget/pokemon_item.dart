import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:poke/app_theme.dart';
import 'package:poke/core/model/pokemon.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PokeAppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                pokemon.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CachedNetworkImage(
              width: 126,
              height: 126,
              fit: BoxFit.cover,
              imageUrl: pokemon.frontImageUrl,
            ),
          ),
        ],
      ),
    );
  }
}

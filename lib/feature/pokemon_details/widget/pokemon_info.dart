import 'package:flutter/material.dart';
import 'package:poke/app_theme.dart';
import 'package:poke/core/model/pokemon_details.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({
    super.key,
    required this.details,
  });

  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: PokeAppColors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Height: ${details.height} cm',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 56),
                  Text(
                    'Weight: ${details.weight} kg',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

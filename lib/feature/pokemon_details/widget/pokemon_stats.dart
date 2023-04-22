import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:poke/app_theme.dart';
import 'package:poke/core/model/stat.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    super.key,
    required this.stats,
    this.color = Colors.black,
  });

  static const int animationDelay = 100;

  final List<Stat> stats;
  final Color color;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ...stats
                  .mapIndexed(
                    (index, stat) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: AnimatedStat(
                        stat: stat,
                        color: color,
                        delayInMillis: animationDelay * index,
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedStat extends StatefulWidget {
  AnimatedStat({
    super.key,
    required this.stat,
    required this.color,
    this.delayInMillis = 0,
  }) : statFraction = stat.baseState / 100;

  final Stat stat;
  final double statFraction;
  final int delayInMillis;
  final Color color;

  @override
  State<AnimatedStat> createState() => _AnimatedStatState();
}

class _AnimatedStatState extends State<AnimatedStat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    Future.delayed(
      Duration(milliseconds: widget.delayInMillis),
      () => _animationController.forward(),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (_, __) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: PokeAppColors.lightGrey,
                  borderRadius: BorderRadius.circular(28),
                ),
                width: constraints.maxWidth,
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(28),
                ),
                width: constraints.maxWidth *
                    widget.statFraction *
                    _animationController.value,
                height: 20,
              ),
              Positioned(
                left: 8,
                child: Text(
                  widget.stat.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

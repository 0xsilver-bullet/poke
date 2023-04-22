import 'package:equatable/equatable.dart';

class Stat extends Equatable {
  const Stat({
    required this.name,
    required this.baseState,
  });

  final String name;
  final int baseState;

  @override
  List<Object> get props => [
        name,
        baseState,
      ];
}

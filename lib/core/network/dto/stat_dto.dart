class StatDto {
  StatDto.fromJson(Map<String, dynamic> json)
      : name = json['stat']['name'],
        baseState = json['base_stat'];

  final String name;
  final int baseState;
}

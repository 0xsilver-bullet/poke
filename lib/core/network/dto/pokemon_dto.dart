class PokemonDto {
  final String name;
  final String url;

  PokemonDto.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];
}

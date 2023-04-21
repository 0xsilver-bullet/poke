import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poke/core/repository/pokemon_repository.dart';
import 'package:poke/core/repository/pokemon_repository_impl.dart';

final locator = GetIt.instance;

void setupDI() {
  _provideDioSingleton();
  _providePokemonRepository();
}

void _provideDioSingleton() {
  final dio = Dio();
  dio.options.responseType = ResponseType.json;
  locator.registerSingleton(dio);
}

void _providePokemonRepository() {
  locator.registerFactory<PokemonRepository>(
    () => PokemonRepositoryImpl(),
  );
}

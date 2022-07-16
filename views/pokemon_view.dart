import '../models/pokemon_model.dart';
import '../repositories/pokemon_repository.dart';
import '../services/network_service.dart';

void main(List<String> args) async {
  NetworkService service = PokemonRepository();
  List<PokemonModel> pokemonList = [];
  for (int i = 1; i <= 5; i++) {
    var response = await service.getData(i);
    PokemonModel pokemonModel = PokemonModel.convertPokemonModel(response);
    pokemonList.add(pokemonModel);
    print("Response $i)\n Id: ${pokemonModel.id}\n Type: ${pokemonModel.name}\n Names[0]: ${pokemonModel.names![0].color}\n Berry Flavor: ${pokemonModel.berryFlavor!.url}\n");
  }
}

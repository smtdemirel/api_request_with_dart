import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../globals/app_contants.dart';
import '../services/network_service.dart';

class PokemonRepository extends NetworkService {
  const PokemonRepository();
  @override
  getData(int? id) async {
    try {
      Response responseData = await http.get(Uri.parse('${AppConstants.pokemonApiUrl}${id??1}'));
      await Future.delayed(Duration(seconds: AppConstants.durationSeconds));
      if (responseData.statusCode == 200) {
        return responseData.body;
      } else {
        return "Connection Error";
      }
    } catch (exception) {
      return "Network Error";
    }
  }
}

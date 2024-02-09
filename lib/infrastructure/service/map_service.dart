import 'package:app_movie/infrastructure/api/api_movi.dart';

import '../models/models.dart';

class MapService {
  static Future<List<PlacesModel>> getPlace(String query) async {
    final place = await ApiMovi().getplaces(query: query);
    try {
      List<PlacesModel> info = [];
      for (var element in place.data) {
        var as = PlacesModel.fromMap(element);
        info.add(as);
      }
      return info;
    } catch (e) {
      return [];
    }
  }
}

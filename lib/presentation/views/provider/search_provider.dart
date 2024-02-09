import 'package:flutter/material.dart';

import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/service/services.dart';

class SearchProvider extends ChangeNotifier {
  List<PlacesModel> listPlace = [];
  serarch(String query) async {
    listPlace = await MapService.getPlace(query);
    notifyListeners();
  }
}

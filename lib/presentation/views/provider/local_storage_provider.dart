import 'package:app_movie/infrastructure/datasources/isra_datasource.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/models/models.dart';

class LocalStorageProvider extends ChangeNotifier {
  IsraDatasource? data;
  LocalStorageProvider() {
    data = IsraDatasource();
  }

  addComent(MovieDetailModel value, String dato) async {
    value.myReview = dato;
    await IsraDatasource().createDetail(value);
    notifyListeners();
  }
}

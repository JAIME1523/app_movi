import 'package:app_movie/config/service/nav_service.dart';
import 'package:app_movie/infrastructure/models/models.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/service/services.dart';

class MovieInfoProvider extends ChangeNotifier {
  MovieDetailModel? infoMovi;
  bool _isLoading = true;

  getInfo(int id) async {
    CheckConection.conection(() async {
      infoMovi = await MovieService.getInfoMovie(id);
      isLoading = false;
    }, () {
      LocalNotificationsService.showSnackbarError('Revise su coneccion');
      NavService.pop();
    });
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

import 'package:app_movie/infrastructure/datasources/isra_datasource.dart';
import 'package:app_movie/infrastructure/models/schemas/user_model.dart';
import 'package:app_movie/presentation/views/views.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/models/models.dart';

enum ViewsStatus { maps, movie, profile }

class HomeProvider extends ChangeNotifier {
  ViewsStatus _viewStatus = ViewsStatus.movie;
  UserModel? user;
  List<MovieDetailModel> listDetail = [];
  Widget profile = const ProfileView();
  Widget maps = const MapsView();
  Widget movie = const MovieView();

  viewSwitch() {
    switch (viewStatus) {
      case ViewsStatus.maps:
        return maps;

      case ViewsStatus.profile:
        return profile;
      case ViewsStatus.movie:
        return movie;

      default:
        movie;
    }
  }

  ViewsStatus get viewStatus => _viewStatus;
  set viewStatus(ViewsStatus value) {
    _viewStatus = value;
    notifyListeners();
  }

  createUser() async {
    user = await IsraDatasource().createUser();
    listDetail = await IsraDatasource().getDetails();
  }

  updateUser(String value) async {
    user!.name = value;
    await IsraDatasource().updateUser(user!);
  }


}


import 'package:app_movie/infrastructure/datasources/isra_datasource.dart';
import 'package:app_movie/infrastructure/models/models.dart';
import 'package:app_movie/infrastructure/models/schemas/movi_shema_model.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/service/services.dart';

class MovieProvider extends ChangeNotifier {
  MovieProvider() {
    getMovies();
  }
  bool _isLoading = true;
  bool _pageLoading = false;
  List<ResultMovie> movies = [];
  MoviShemaModel? pageMove;

  Future getMovies() async {
    CheckConection.conection(() async {
       if (pageMove == null) {
      pageMove = MoviShemaModel(page: 1);
      pageMove!.page = await IsraDatasource().getPage();
    }
      final listMovie = await MovieService.getMovies(1);
      movies = listMovie.results;
      pageMove!.page = listMovie.page;
      await IsraDatasource().deleteData();
      await IsraDatasource().saveMovie(
          movies,
          MoviShemaModel(
            page: pageMove!.page,
          ));
      isLoading = false;
    }, () async {
      movies = await IsraDatasource().searchData();
      isLoading = false;
    });
  }

  

  Future nextPage() async {
    if (pageMove == null) {
      pageMove = MoviShemaModel(page: 1);
      pageMove!.page = await IsraDatasource().getPage();
    }
    if (_pageLoading) return;
    _pageLoading = true;
    try {
      final listMovie = await MovieService.getMovies(pageMove!.page + 1);
      movies.addAll(listMovie.results);
      await IsraDatasource()
          .saveMovie(listMovie.results, MoviShemaModel(page: listMovie.page));
      _pageLoading = false;
      notifyListeners();
    } catch (e) {
      _pageLoading = false;
      notifyListeners();
    }

    _pageLoading = false;
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

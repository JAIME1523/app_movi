import 'package:app_movie/infrastructure/api/api_movi.dart';

import '../models/models.dart';

class MovieService {
  static Future<MovieModel> getMovies(int? page) async {
    final resp =
        await ApiMovi().getMoviApi(path: '/movie/now_playing', page: page!);
    final listModel = MovieModel.fromMap(resp.data);
    return listModel;
  }

  static Future<MovieDetailModel> getInfoMovie(int? id) async {
    final resp = await  ApiMovi().getMoviApi(path: '/movie/$id');
    final listModel = MovieDetailModel.fromMap(resp.data);
    return listModel;
  }
}

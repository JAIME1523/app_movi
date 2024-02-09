import 'package:dio/dio.dart';

class ApiMovi {
  final Dio _dioPLaces;
  final Dio _movieDio;


  ApiMovi()
      : _dioPLaces = Dio(BaseOptions(
            baseUrl: 'https://api.locationiq.com/v1/autocomplete.php'))
          ..interceptors.add(PlacesInterceptor()),
        _movieDio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3'))..interceptors.add(MovieInterceptor());


   Future<Response> getMoviApi(
      {required String path, int page = 1}) async {
    final info = await _movieDio.get(path, queryParameters: {'page': page});
    return info;
  }

    Future<Response> getplaces(
      {required String query,  }) async {
    final info = await _dioPLaces.get('?q=$query',);
    return info;
  }

}




class MovieInterceptor extends Interceptor {
  final accesToken = 'pk.2769150a5b92d668096b7ea65e1dccbd';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
        'api_key': 'b7177d1d6ae34878a270d6b8c2509e31',
        'language': 'es-MX'
      });
    super.onRequest(options, handler);
  }
}

class PlacesInterceptor extends Interceptor {
  final accesToken = 'pk.2769150a5b92d668096b7ea65e1dccbd';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'viewbox':
          '-98.86064949639152,19.51113489408835,-99.13427773114253,19.428917602875405',
      'key': accesToken,
      'accept-language': 'es',
      'limit': 5
    });
    super.onRequest(options, handler);
  }
}

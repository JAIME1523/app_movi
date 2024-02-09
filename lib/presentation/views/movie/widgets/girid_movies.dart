import 'package:app_movie/config/service/nav_service.dart';
import 'package:app_movie/presentation/pages/movie_info_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../infrastructure/models/models.dart';

class GridMovies extends StatelessWidget {
  const GridMovies({Key? key, required this.movies}) : super(key: key);
  final List<ResultMovie> movies;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      // spacing:1 ,
      runSpacing: 15,
      children: [
        ...List.generate(movies.length, (index) {
          final movi = movies[index];
          return SizedBox(
            width: size.width * 0.4,
            child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      NavService.push(MovieInfoPage(
                        id: movi.id,
                      ));
                    },
                    child: _MovieItem(movie: movi)),
                Text(
                  movi.title,
                  maxLines: 2,
                  style: textStyle.titleSmall,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.yellow[800],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movi.voteAverage.toString(),
                      style: textStyle.bodyMedium!
                          .copyWith(color: Colors.yellow[800]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      NumberFormat.compactCurrency(symbol: '', locale: 'es_MX', decimalDigits: 1).format(movi.popularity),
                      style: textStyle.bodySmall,
                    )
                  ],
                )
              ],
            ),
          );
        })
      ],
    );
  }
}

class _MovieItem extends StatelessWidget {
  final ResultMovie movie;
  const _MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: 200,
      width: size.width * 0.4,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.network(
            movie.backdropPath!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/error.png');
            },
          )),
    );
  }
}

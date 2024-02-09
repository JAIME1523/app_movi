import 'package:app_movie/infrastructure/models/movie_detail_model.dart';
import 'package:app_movie/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../config/service/nav_service.dart';
import '../../pages/provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final style = Theme.of(context).textTheme;

    final provider = context.watch<HomeProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    color: colors.secondaryContainer,
                    child: Image.asset(
                      'assets/person.png',
                      width: 120,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: provider.user!.name ?? '',
                  style: style.titleLarge,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      provider.updateUser(value);
                    }
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            'Peliculas que opinaste',
            style: style.titleLarge,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GridMovies(movies: provider.listDetail),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class GridMovies extends StatelessWidget {
  const GridMovies({Key? key, required this.movies}) : super(key: key);
  final List<MovieDetailModel> movies;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      // spacing:1 ,
      spacing: 15,
      children: [
        ...List.generate(movies.length, (index) {
          final movi = movies[index];
          return SizedBox(
            width: size.width * 0.4,
            child: Column(
              children: [
                GestureDetector( onTap: () {
                      NavService.push(MovieInfoPage(
                        id: movi.id,
                      ));
                    }, child: _MovieItem(movie: movi)),
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
                      NumberFormat.compactCurrency(
                              symbol: '', locale: 'es_MX', decimalDigits: 1)
                          .format(movi.popularity),
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
  final MovieDetailModel movie;
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

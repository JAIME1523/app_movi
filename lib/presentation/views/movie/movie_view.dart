import 'package:app_movie/presentation/views/movie/widgets/girid_movies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final moviProvider = context.watch<MovieProvider>();
      return moviProvider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              height: double.infinity,
              child: _ScrollWidget(moviProvider: moviProvider));
    });
  }
}

class _ScrollWidget extends StatefulWidget {
  const _ScrollWidget({
    required this.moviProvider,
  });

  final MovieProvider moviProvider;

  @override
  State<_ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<_ScrollWidget> {
  final scrollcontroller = ScrollController();
  @override
  void initState() {
    super.initState();

    

    scrollcontroller.addListener(() {
      if ((scrollcontroller.position.pixels + 200) >=
          (scrollcontroller.position.maxScrollExtent)) {
        Provider.of<MovieProvider>(context, listen: false).nextPage();
       
      }
    });
  }

  @override
  void dispose() {
    scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollcontroller,
        child: GridMovies(
          movies: widget.moviProvider.movies,
        ));
  }
}

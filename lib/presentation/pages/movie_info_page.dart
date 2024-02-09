import 'package:app_movie/presentation/pages/provider/provider.dart';
import 'package:app_movie/presentation/views/provider/local_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieInfoPage extends StatelessWidget {
  final int id;
  const MovieInfoPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieInfoProvider()..getInfo(id),
      child: Builder(builder: (context) {
        final provider = context.watch<MovieInfoProvider>();

        return Scaffold(
          body: provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: <Widget>[_CustomSliver(), _MiveDetails()],
                ),
        );
      }),
    );
  }
}

class _MiveDetails extends StatelessWidget {
  const _MiveDetails();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MovieInfoProvider>();
    final texstStyle = Theme.of(context).textTheme;

    final size = MediaQuery.sizeOf(context);
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    provider.infoMovi!.posterPath!,
                    width: size.width * 0.3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: (size.width - 40) * 0.7,
                  child: Column(children: [
                    Text(
                      provider.infoMovi!.title,
                      style: texstStyle.titleLarge,
                    ),
                    Text(provider.infoMovi!.overview)
                  ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                ...provider.infoMovi!.genres!.map((e) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(label: Text(e.name))))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(196, 196, 196, 1.0),
              ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Deje un comentario',
              ),
              maxLines: 10,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  Provider.of<LocalStorageProvider>(context)
                      .addComent(provider.infoMovi!, value);
                  
                }
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      );
    }));
  }
}

class _CustomSliver extends StatelessWidget {
  const _CustomSliver();
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MovieInfoProvider>();

    final size = MediaQuery.sizeOf(context);
    return SliverAppBar(
      expandedHeight: size.height * 0.65,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          provider.infoMovi!.title,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                provider.infoMovi!.posterPath!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.7, 1.0],
                            colors: [Colors.transparent, Colors.black87])))),
            const SizedBox.expand(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            // end: Alignment.bottomCenter,
                            stops: [0.0, 0.4],
                            colors: [Colors.black87, Colors.transparent]))))
          ],
        ),
      ),
    );
  }
}

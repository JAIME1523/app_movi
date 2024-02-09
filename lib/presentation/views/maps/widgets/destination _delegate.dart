import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../infrastructure/models/models.dart';
import '../../provider/provider.dart';

class DestinationDelegate extends SearchDelegate {
  DestinationDelegate() : super(searchFieldLabel: 'Buscar...');
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchProvider()..serarch(query),
      child: Builder(builder: (context) {
        final provi = context.watch<SearchProvider>();
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            PlacesModel place = provi.listPlace[index];
            return ListTile(
              title: Text(place.displayName),
              subtitle: Text(
                place.displayName,
                style: const TextStyle(fontSize: 12),
              ),
              leading: const Icon(
                Icons.place_outlined,
                color: Colors.black,
              ),
              onTap: () {
                close(context, place);
              },
            );
          },
          itemCount: provi.listPlace.length,
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return ListView(
      children: const [],
    );
  }
}

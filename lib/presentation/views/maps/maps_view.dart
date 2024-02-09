import 'package:app_movie/presentation/views/maps/widgets/destination%20_delegate.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class MapsView extends StatelessWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapsProvider(),
      child: const _ContentMap(),
    );
  }
}

class _ContentMap extends StatelessWidget {
  const _ContentMap();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MapsProvider>();
    return Stack(
      children: [
        GoogleMap(
            markers: provider.markers.values.toSet(),
             onMapCreated: ((controller) =>
            provider.creoateMap (controller)),
            initialCameraPosition: provider.getCameraPosition),
        const _Search(),
      ],
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MapsProvider>();

    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
          onTap: () async {
            final result = await showSearch(
                context: context, delegate: DestinationDelegate());
            if (result == null) return;
            provider.addMark(result);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5)),
                ]),
            child: const Text(
              'Donde quieres ir ? ',
              style: TextStyle(color: Colors.black87),
            ),
          )),
    );
  }
}

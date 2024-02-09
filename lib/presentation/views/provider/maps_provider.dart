import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../infrastructure/models/models.dart';

class MapsProvider extends ChangeNotifier {
  final Map<String, Marker> markers = {
    '1': const Marker(
        anchor: Offset(0.1, 1),
        markerId: MarkerId('start'),
        position: LatLng(19.4305239, -99.1962854)),
  };

  GoogleMapController? mapController;
  CameraPosition getCameraPosition =
      const CameraPosition(zoom: 15, target: LatLng(19.4305239, -99.1962854));

  addMark(PlacesModel place) {
    markers.addAll({
      place.placeId: Marker(
          anchor: const Offset(0.1, 1),
          markerId: MarkerId(place.placeId),
          position: LatLng(double.parse(place.lat), double.parse(place.lon))),
    });
    final cameraUpdate = CameraUpdate.newLatLng(
        LatLng(double.parse(place.lat), double.parse(place.lon)));

    mapController!.animateCamera(cameraUpdate);
    notifyListeners();
  }

  creoateMap(GoogleMapController controller) {
    mapController = controller;
  }
}

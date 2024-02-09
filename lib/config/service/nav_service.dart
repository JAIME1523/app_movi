import 'package:flutter/material.dart';

class NavService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static push(Widget routeWidget, {void Function(dynamic)? functionThen}) {
    return navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (_) => routeWidget))
        .then(functionThen ?? (value) {});
  }

  static pop({int numberSreen = 1}) {
    for (var i = 0; i < numberSreen; i++) {
      navigatorKey.currentState!.pop();
    }
  }
}

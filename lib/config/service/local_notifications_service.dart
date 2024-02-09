import 'package:flutter/material.dart';

class LocalNotificationsService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    messagerKey.currentState!.clearSnackBars();
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    messagerKey.currentState!.showSnackBar(snackbar);
  }

}

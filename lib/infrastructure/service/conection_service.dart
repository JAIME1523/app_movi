import 'dart:io';

class CheckConection {
  static conection(Function onPressed, Function offlineFunction) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        onPressed();
      }
    } on SocketException catch (_) {
      offlineFunction();
    }
  }
}
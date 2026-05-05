import 'dart:io';
import 'package:flutter/foundation.dart';

Future<bool> checkInternet() async {
  if (kIsWeb) {
    return true;
  }

  try {
    final result = await InternetAddress.lookup("google.com");
    return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
  } on SocketException {
    return false;
  } catch (_) {
    return false;
  }
}

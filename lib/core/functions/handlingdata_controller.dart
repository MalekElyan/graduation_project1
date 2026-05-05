import 'package:project/core/class/stutusrequest.dart';

StatusRequest handlingData(dynamic response) {
  if (response is StatusRequest) {
    if (response == StatusRequest.offlineFailure) {
      return StatusRequest.offlineFailure;
    } else {
      return StatusRequest.serverFailure;
    }
  } else {
    return StatusRequest.success;
  }
}

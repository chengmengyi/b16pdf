import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:get/get.dart';

abstract class B16RootControllerFjesak extends GetxController {
  StreamSubscription<B16EventBeanFhifeode>? b16EventSubscriptiondjeidji;

  @override
  void onInit() {
    super.onInit();
    if (b16RegisterEventfeijif()) {
      b16EventSubscriptiondjeidji = B16EventHepFjiejizx.instance
          .b16RegisterEventhuejife(
            b16EventCallbackDzwxqn: b16HandleEventhrifjei,
          );
    }
  }

  bool b16RegisterEventfeijif() => false;

  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) {}

  @override
  void onClose() {
    if (b16RegisterEventfeijif()) {
      b16EventSubscriptiondjeidji?.cancel();
      b16EventSubscriptiondjeidji = null;
    }
    super.onClose();
  }
}

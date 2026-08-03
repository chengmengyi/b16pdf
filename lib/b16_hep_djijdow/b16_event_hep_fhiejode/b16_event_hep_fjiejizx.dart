import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:event_bus/event_bus.dart';

typedef B16EventCallbackDzwxqn =
    void Function(B16EventBeanFhifeode b16EventBeanFhifeode);

class B16EventHepFjiejizx {
  static final B16EventHepFjiejizx _b16eventHepFjiejizx = B16EventHepFjiejizx();
  static B16EventHepFjiejizx get instance => _b16eventHepFjiejizx;

  final EventBus _b16EventBusfjijife = EventBus();

  void b16SendMsgFjijeio(B16EventBeanFhifeode b16EventBeanFhifeode) {
    _b16EventBusfjijife.fire(b16EventBeanFhifeode);
  }

  StreamSubscription<B16EventBeanFhifeode> b16RegisterEventhuejife({
    required B16EventCallbackDzwxqn b16EventCallbackDzwxqn,
  }) {
    return _b16EventBusfjijife.on<B16EventBeanFhifeode>().listen(
      b16EventCallbackDzwxqn,
    );
  }
}

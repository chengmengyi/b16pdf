import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';

class B16ApplifeHepFjeifje {
  B16ApplifeHepFjeifje._();

  static final B16ApplifeHepFjeifje instance = B16ApplifeHepFjeifje._();
  bool b16ObserverStartedHqmxwe = false;

  void b16StartObserverKpvnza() {
    if (b16ObserverStartedHqmxwe) {
      return;
    }
    b16ObserverStartedHqmxwe = true;
    FlutterAppLifecycle.instance.setCallObserver(
      AppStateObserver(
        call: (bool b16InBackgroundVqmwxe) {
          B16EventHepFjiejizx.instance.b16SendMsgFjijeio(
            B16EventBeanFhifeode(
              b16EventCodeFhfemie: B16EventCodeQxmvza.b16AppLifecycleKqmwze,
              b16IntValueDjijie: b16InBackgroundVqmwxe ? 1 : 0,
            ),
          );
        },
      ),
    );
  }
}

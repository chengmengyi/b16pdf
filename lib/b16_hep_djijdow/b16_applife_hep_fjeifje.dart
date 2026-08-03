import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';

class B16ApplifeHepFjeifje{
  static final B16ApplifeHepFjeifje _b16applifeHepFjeifje=B16ApplifeHepFjeifje();
  static B16ApplifeHepFjeifje get instance => _b16applifeHepFjeifje;

  initLife(){
    FlutterAppLifecycle.instance.setCallObserver(
      AppStateObserver(
        call: (bool back) {

        },
      ),
    );
  }
}
import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_hot_launcher_source_hep_djiwdjw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';

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
          if (b16InBackgroundVqmwxe) {
            _appBack();
          } else {
            unawaited(_appFront());
          }
        },
      ),
    );
  }

  void _appBack() {}

  Future<void> _appFront() async {
    unawaited(B16NotificationHepPqnvze.instance.b16UploadPendingNotificationEventsTqnvze());
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final B16HotLauncherSourceInfoKqmwze? b16SourcePqnvze = B16HotLauncherSourceHepDjiwdjw.instance.b16ConsumeSourceVqntza();
    if (b16SourcePqnvze == null) {
      showAd(B16AdSceneJdwo.pr_launch, B16PosidJkwkosw.pr_open_hot);
      return;
    }
    switch (b16SourcePqnvze.b16TypeVqntza) {
      case B16HotLauncherSourceTypeQxnvza.notification:
        return;
      case B16HotLauncherSourceTypeQxnvza.quickAction:
        showAd(B16AdSceneJdwo.pr_exit, B16PosidJkwkosw.unload_1);
    }
  }

  showAd(
    B16AdSceneJdwo b16AdSceneQxnvza,
    B16PosidJkwkosw b16PositionIdVqntza,
  ) async{
    await FlutterPdfAdPlugins.instance.closeFullScreenAdAndWait();
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
      b16AdScenePqmvzr: b16AdSceneQxnvza,
      b16AdPosIdKqmvzr: b16PositionIdVqntza,
    );
  }
}

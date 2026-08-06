import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';

class B16LauncherClickGateHepQxnvza {
  B16LauncherClickGateHepQxnvza._();

  static final B16LauncherClickGateHepQxnvza instance =
      B16LauncherClickGateHepQxnvza._();

  bool _b16LauncherAliveKqmwze = true;
  bool _b16LauncherAdShownVqntza = false;
  B16AdSceneJdwo? _b16PendingAdScenePqnvze;
  B16PosidJkwkosw? _b16PendingAdPosIdHqmwza;

  bool get b16CanHandleNotificationClickKqnvxe =>
      !_b16LauncherAliveKqmwze || _b16LauncherAdShownVqntza;

  void b16MarkLauncherStartedQxnvza() {
    _b16LauncherAliveKqmwze = true;
    _b16LauncherAdShownVqntza = false;
    _b16ClearPendingAdRqmwza();
  }

  void b16MarkLauncherAdWaitingVqntza({
    required B16AdSceneJdwo b16AdScenePqnvze,
    required B16PosidJkwkosw b16AdPosIdKqmwze,
  }) {
    _b16LauncherAdShownVqntza = false;
    _b16PendingAdScenePqnvze = b16AdScenePqnvze;
    _b16PendingAdPosIdHqmwza = b16AdPosIdKqmwze;
  }

  void b16MarkLauncherAdShownIfMatchedHqmwza({
    required B16AdSceneJdwo b16AdScenePqnvze,
    required B16PosidJkwkosw b16AdPosIdKqmwze,
  }) {
    if (!_b16LauncherAliveKqmwze ||
        _b16PendingAdScenePqnvze != b16AdScenePqnvze ||
        _b16PendingAdPosIdHqmwza != b16AdPosIdKqmwze) {
      return;
    }
    _b16LauncherAdShownVqntza = true;
    _b16ClearPendingAdRqmwza();
  }

  void b16MarkLauncherAdNotShownPqnvze() {
    _b16LauncherAdShownVqntza = false;
    _b16ClearPendingAdRqmwza();
  }

  void b16MarkLauncherClosedKqmwze() {
    _b16LauncherAliveKqmwze = false;
    _b16ClearPendingAdRqmwza();
  }

  void _b16ClearPendingAdRqmwza() {
    _b16PendingAdScenePqnvze = null;
    _b16PendingAdPosIdHqmwza = null;
  }
}

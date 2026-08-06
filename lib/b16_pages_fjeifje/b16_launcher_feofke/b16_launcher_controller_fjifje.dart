import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_applife_hep_fjeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_cold_launcher_source_hep_jiwjdow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_launcher_click_gate_hep_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_quick_action_hep_fjeifjiw.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:get/get.dart';

class B16LauncherControllerFjifje extends B16RootControllerFjesak
    with GetSingleTickerProviderStateMixin {
  static const String b16ProgressUpdateIdQmxvza = 'b16_launcher_progress';
  static const Duration b16LaunchDurationVqmwxe = Duration(seconds: 15);

  late final AnimationController b16ProgressControllerKqnvza;
  late B16AdSceneJdwo b16LaunchAdSceneQxnvza;
  late B16PosidJkwkosw b16LaunchAdPosIdKqmwze;
  Duration b16NewUserOpenAdCheckTimeVqntza = const Duration(seconds: 12);
  bool b16NavigationStartedHqmwxe = false;

  final Stopwatch _b16AdCheckStopwatchPqnvze = Stopwatch();
  Timer? _b16AdCheckTimerKqnvxe;
  bool _b16CheckingAdPqmxza = false;
  bool _b16InBackgroundVqntze = false;

  double get b16ProgressValuePqmxra => b16ProgressControllerKqnvza.value;

  bool get _b16UseNewLaunchAdHqmwza =>
      B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16LoadNewLaunchAdQxnvza;

  @override
  void onInit() {
    super.onInit();
    B16LauncherClickGateHepQxnvza.instance.b16MarkLauncherStartedQxnvza();
    _b16ResolveLaunchAdQxnvza();
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16UploadAdChanceKqnvxe(
      b16AdScenePqmvzr: b16LaunchAdSceneQxnvza,
      b16AdPosIdKqmvzr: b16LaunchAdPosIdKqmwze,
    );
    b16ProgressControllerKqnvza =
        AnimationController(vsync: this, duration: b16LaunchDurationVqmwxe)
          ..addListener(b16NotifyProgressRkqvma)
          ..addStatusListener(b16HandleAnimationStatusTqmxze)
          ..forward();
    _b16AdCheckStopwatchPqnvze.start();
    _b16AdCheckTimerKqnvxe = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) => _b16CheckCachedAdPqmxza(),
    );
  }

  void _b16ResolveLaunchAdQxnvza() {
    if (_b16UseNewLaunchAdHqmwza) {
      b16LaunchAdSceneQxnvza = B16AdSceneJdwo.pr_new_launch;
      b16LaunchAdPosIdKqmwze = B16PosidJkwkosw.pr_new_open;
      return;
    }

    final String b16NotificationPayloadPqnvze =
        B16ColdLauncherSourceHepJiwjdow.instance.notificationPayload ?? '';
    if (b16NotificationPayloadPqnvze.isNotEmpty) {
      b16LaunchAdSceneQxnvza = B16AdSceneJdwo.pr_launch;
      b16LaunchAdPosIdKqmwze =
          b16NotificationPayloadPqnvze == LocalNotificationPayload.media.value
          ? B16PosidJkwkosw.pr_open_mediapop
          : B16PosidJkwkosw.pr_open_cold;
      return;
    }

    final String b16QuickActionTypeKqnvxe =
        B16ColdLauncherSourceHepJiwjdow.instance.b16QuickActionTypeKqmwze ?? '';
    if (b16QuickActionTypeKqnvxe.isNotEmpty) {
      b16LaunchAdSceneQxnvza = B16AdSceneJdwo.pr_exit;
      b16LaunchAdPosIdKqmwze = B16PosidJkwkosw.unload_1;
      return;
    }

    b16LaunchAdSceneQxnvza = B16AdSceneJdwo.pr_launch;
    b16LaunchAdPosIdKqmwze = B16PosidJkwkosw.pr_open_cold;
  }

  void b16NotifyProgressRkqvma() {
    update([b16ProgressUpdateIdQmxvza]);
  }

  void b16HandleAnimationStatusTqmxze(AnimationStatus b16StatusVqmpra) {
    if (b16StatusVqmpra != AnimationStatus.completed ||
        b16NavigationStartedHqmwxe) {
      return;
    }
    b16NavigationStartedHqmwxe = true;
    _b16AdCheckTimerKqnvxe?.cancel();
    _b16HandleLaunchDeadlineRqmwza();
  }

  Future<void> _b16CheckCachedAdPqmxza() async {
    if (b16NavigationStartedHqmwxe ||
        _b16InBackgroundVqntze ||
        _b16CheckingAdPqmxza) {
      return;
    }
    _b16CheckingAdPqmxza = true;
    final B16AdSceneJdwo b16SceneTqnvze = _b16CurrentCheckSceneVqmxza();
    final B16PosidJkwkosw b16PosIdRqmwza = _b16PosIdForSceneKqnvxe(
      b16SceneTqnvze,
    );
    final bool b16HasAdQxnvza = await _b16HasCachedAdHqmwza(b16SceneTqnvze);
    _b16CheckingAdPqmxza = false;
    if (!b16HasAdQxnvza || b16NavigationStartedHqmwxe) {
      return;
    }
    b16NavigationStartedHqmwxe = true;
    await _b16ShowLaunchAdVqntza(b16SceneTqnvze, b16PosIdRqmwza);
  }

  B16AdSceneJdwo _b16CurrentCheckSceneVqmxza() {
    if (_b16UseNewLaunchAdHqmwza &&
        _b16AdCheckStopwatchPqnvze.elapsed < b16NewUserOpenAdCheckTimeVqntza) {
      return B16AdSceneJdwo.pr_new_launch;
    }
    if (_b16UseNewLaunchAdHqmwza) {
      return B16AdSceneJdwo.pr_launch;
    }
    return b16LaunchAdSceneQxnvza;
  }

  B16PosidJkwkosw _b16PosIdForSceneKqnvxe(B16AdSceneJdwo b16SceneQxnvza) {
    if (b16SceneQxnvza == B16AdSceneJdwo.pr_new_launch) {
      return B16PosidJkwkosw.pr_new_open;
    }
    if (_b16UseNewLaunchAdHqmwza &&
        b16SceneQxnvza == B16AdSceneJdwo.pr_launch) {
      return B16PosidJkwkosw.pr_open_cold;
    }
    return b16LaunchAdPosIdKqmwze;
  }

  Future<bool> _b16HasCachedAdHqmwza(B16AdSceneJdwo b16SceneVqntza) async {
    try {
      final AdInfoBean? b16CachedAdPqnvze = await FlutterPdfAdPlugins.instance
          .getAvailableCachedAdInfo<B16AdSceneJdwo>(b16SceneVqntza);
      return b16CachedAdPqnvze != null;
    } catch (_) {
      return false;
    }
  }

  Future<void> _b16HandleLaunchDeadlineRqmwza() async {
    if (_b16UseNewLaunchAdHqmwza) {
      if (b16NewUserOpenAdCheckTimeVqntza >= b16LaunchDurationVqmwxe) {
        final bool b16HasNewAdQxnvza = await _b16HasCachedAdHqmwza(
          B16AdSceneJdwo.pr_new_launch,
        );
        if (b16HasNewAdQxnvza) {
          await _b16ShowLaunchAdVqntza(
            B16AdSceneJdwo.pr_new_launch,
            B16PosidJkwkosw.pr_new_open,
          );
          return;
        }
      }
      final bool b16HasFallbackAdKqmwze = await _b16HasCachedAdHqmwza(
        B16AdSceneJdwo.pr_launch,
      );
      if (b16HasFallbackAdKqmwze) {
        await _b16ShowLaunchAdVqntza(
          B16AdSceneJdwo.pr_launch,
          B16PosidJkwkosw.pr_open_cold,
        );
        return;
      }
    } else if (await _b16HasCachedAdHqmwza(b16LaunchAdSceneQxnvza)) {
      await _b16ShowLaunchAdVqntza(
        b16LaunchAdSceneQxnvza,
        b16LaunchAdPosIdKqmwze,
      );
      return;
    }
    await b16FinishLauncherQxnvza();
  }

  Future<void> _b16ShowLaunchAdVqntza(
    B16AdSceneJdwo b16SceneQxnvza,
    B16PosidJkwkosw b16PosIdKqmwze,
  ) async {
    _b16AdCheckTimerKqnvxe?.cancel();
    _b16AdCheckStopwatchPqnvze.stop();
    if (b16ProgressControllerKqnvza.isAnimating) {
      b16ProgressControllerKqnvza.stop(canceled: false);
    }
    B16LauncherClickGateHepQxnvza.instance.b16MarkLauncherAdWaitingVqntza(
      b16AdScenePqnvze: b16SceneQxnvza,
      b16AdPosIdKqmwze: b16PosIdKqmwze,
    );
    final bool? b16DidShowAdRqmwza = await B16AdHepJiwdjow
        .b16AdUtilsInstanceKqmvzr
        .b16ShowCachedSceneAdPqmvzr(
          b16AdScenePqmvzr: b16SceneQxnvza,
          b16AdPosIdKqmvzr: b16PosIdKqmwze,
          b16UploadChancePqnvze: false,
        );
    if (b16DidShowAdRqmwza != true) {
      B16LauncherClickGateHepQxnvza.instance.b16MarkLauncherAdNotShownPqnvze();
    }
    await b16FinishLauncherQxnvza();
  }

  Future<void> b16FinishLauncherQxnvza() async {
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16PreloadAdBySceneKqmwze(
      B16AdSceneJdwo.pr_user_use,
    );
    var result = await B16QuickActionHepFjeifjiw.instance
        .b16ConsumeColdStartActionVqntza();
    if (result) {
      return;
    }
    B16NewUserHepJfiejfo.instance.toPageChooseLanguage();
  }

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  // ignore: avoid_renaming_method_parameters
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) {
    if (b16EventQzmxva.b16EventCodeFhfemie ==
        B16EventCodeQxmvza.b16NewOpenAdCheckTimeQxnvza) {
      final int b16SecondsKqmwze = b16EventQzmxva.b16IntValueDjijie ?? 0;
      if (b16SecondsKqmwze > 0) {
        b16NewUserOpenAdCheckTimeVqntza = Duration(seconds: b16SecondsKqmwze);
      }
      return;
    }
    if (b16EventQzmxva.b16EventCodeFhfemie !=
        B16EventCodeQxmvza.b16AppLifecycleKqmwze) {
      return;
    }
    _b16InBackgroundVqntze = b16EventQzmxva.b16IntValueDjijie == 1;
    if (_b16InBackgroundVqntze) {
      _b16AdCheckStopwatchPqnvze.stop();
      b16ProgressControllerKqnvza.stop(canceled: false);
    } else {
      _b16AdCheckStopwatchPqnvze.start();
      if (!b16ProgressControllerKqnvza.isCompleted &&
          !b16ProgressControllerKqnvza.isAnimating) {
        b16ProgressControllerKqnvza.forward();
      }
    }
  }

  @override
  void onClose() {
    B16ApplifeHepFjeifje.instance.b16StartObserverKpvnza();
    B16LauncherClickGateHepQxnvza.instance.b16MarkLauncherClosedKqmwze();
    _b16AdCheckTimerKqnvxe?.cancel();
    _b16AdCheckStopwatchPqnvze.stop();
    b16ProgressControllerKqnvza
      ..removeListener(b16NotifyProgressRkqvma)
      ..removeStatusListener(b16HandleAnimationStatusTqmxze)
      ..dispose();
    super.onClose();
  }
}

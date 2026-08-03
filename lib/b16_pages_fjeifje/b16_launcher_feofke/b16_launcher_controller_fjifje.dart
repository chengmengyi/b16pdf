import 'package:b16pdf/b16_hep_djijdow/b16_applife_hep_fjeifje.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class B16LauncherControllerFjifje extends B16RootControllerFjesak
    with GetSingleTickerProviderStateMixin {
  static const String b16ProgressUpdateIdQmxvza = 'b16_launcher_progress';
  static const Duration b16LaunchDurationVqmwxe = Duration(seconds: 15);

  late final AnimationController b16ProgressControllerKqnvza;
  bool b16NavigationStartedHqmwxe = false;

  double get b16ProgressValuePqmxra => b16ProgressControllerKqnvza.value;

  @override
  void onInit() {
    super.onInit();
    b16ProgressControllerKqnvza =
        AnimationController(vsync: this, duration: b16LaunchDurationVqmwxe)
          ..addListener(b16NotifyProgressRkqvma)
          ..addStatusListener(b16HandleAnimationStatusTqmxze)
          ..forward();
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
    B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
      b16RouteNameYweqpn:
          B16RoutersAddressFjeifjeo.b16OverlayPermissionRouteNqvwza,
    );
  }

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  // ignore: avoid_renaming_method_parameters
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) {
    if (b16EventQzmxva.b16EventCodeFhfemie !=
        B16ApplifeHepFjeifje.b16LifecycleEventCodeQmrvza) {
      return;
    }
    final bool b16InBackgroundKqmvze = b16EventQzmxva.b16IntValueDjijie == 1;
    if (b16InBackgroundKqmvze) {
      b16ProgressControllerKqnvza.stop(canceled: false);
    } else if (!b16ProgressControllerKqnvza.isCompleted &&
        !b16ProgressControllerKqnvza.isAnimating) {
      b16ProgressControllerKqnvza.forward();
    }
  }

  @override
  void onClose() {
    b16ProgressControllerKqnvza
      ..removeListener(b16NotifyProgressRkqvma)
      ..removeStatusListener(b16HandleAnimationStatusTqmxze)
      ..dispose();
    super.onClose();
  }
}

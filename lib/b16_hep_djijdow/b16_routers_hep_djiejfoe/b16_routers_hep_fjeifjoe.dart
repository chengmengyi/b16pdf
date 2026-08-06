import 'dart:async';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract final class B16RoutersHepFjeifjoe {
  static Future<T?>? b16PushNamedHkqvpa<T>({
    required String b16RouteNameMcfzsq,
    Map<String, dynamic>? b16ArgumentsXvedlu,
  }) {
    return Get.toNamed<T>(b16RouteNameMcfzsq, arguments: b16ArgumentsXvedlu);
  }

  static Future<T?>? b16ReplaceNamedZxplrt<T>({
    required String b16RouteNameYweqpn,
    Map<String, dynamic>? b16ArgumentsKstjva,
  }) {
    return Get.offNamed<T>(b16RouteNameYweqpn, arguments: b16ArgumentsKstjva);
  }

  static Future<T?>? b16ResetToNamedNvrmce<T>({
    required String b16RouteNameDqyxka,
    Map<String, dynamic>? b16ArgumentsBlgfru,
  }) {
    return Get.offAllNamed<T>(
      b16RouteNameDqyxka,
      arguments: b16ArgumentsBlgfru,
    );
  }

  static void b16PopUntilNameWvxhqt(String b16RouteNamePzjlem) {
    Get.until((b16RouteKqmcdu) {
      return b16RouteKqmcdu.settings.name == b16RouteNamePzjlem;
    });
  }

  static void b16BackFtynwp<T>({T? b16ResultNcgkqe}) {
    Get.back<T>(result: b16ResultNcgkqe);
  }

  static void b16BackWithExitAdPqnvze<T>({T? b16ResultKqmwze}) {
    Get.back<T>(result: b16ResultKqmwze);
    b16ShowExitAdIfNeededVqntza();
  }

  static void b16ShowExitAdIfNeededVqntza() {
    if (!B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      return;
    }
    unawaited(
      Future<void>.delayed(Duration.zero, () async {
        await B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr
            .b16ShowCachedSceneAdPqmvzr(
              b16AdScenePqmvzr: B16AdSceneJdwo.pr_exit,
              b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_exit_app,
            );
      }),
    );
  }

  static Future<T?> b16ShowBottomSheetVxqprn<T>({
    required Widget b16ChildQnwxza,
    bool b16DismissibleMkrvte = true,
    Color? b16BarrierColorHpxqwy,
    bool b16ScrollControlledZnlqde = true,
  }) {
    return Get.bottomSheet<T>(
      SafeArea(top: true, bottom: true, child: b16ChildQnwxza),
      isScrollControlled: b16ScrollControlledZnlqde,
      barrierColor: b16BarrierColorHpxqwy,
      isDismissible: b16DismissibleMkrvte,
    );
  }

  static Future<T?> b16ShowDialogCtmxqe<T>({
    required Widget b16ChildWvprka,
    bool b16BarrierDismissibleZxmqny = false,
    bool b16UseSafeAreaYtqwlp = false,
  }) {
    return Get.dialog<T>(
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: b16ChildWvprka,
      ),
      useSafeArea: b16UseSafeAreaYtqwlp,
      barrierDismissible: b16BarrierDismissibleZxmqny,
    );
  }

  static Map<String, dynamic> getParams() {
    try {
      return Get.arguments as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

}

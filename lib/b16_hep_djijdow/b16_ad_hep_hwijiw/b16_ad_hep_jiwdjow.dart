import 'dart:convert';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_ad_switch_storage_vqntza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_firebase_ad_config_storage_hqmwza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_last_ad_show_time_storage_pqnvze.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_load_new_launch_ad_storage_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_firebase_hep_djiwjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_launcher_click_gate_hep_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_af_new/flutter_check_af_new.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:appsflyer_sdk_plus/appsflyer_sdk.dart';

class B16AdHepJiwdjow implements FlutterPdfAdListener {
  static final B16AdHepJiwdjow _b16AdUtilsInstancePqmvzr = B16AdHepJiwdjow._();

  B16AdHepJiwdjow._();

  bool b16LoadNewLaunchAdQxnvza = false;
  int _b16LastShowCachedSceneAdTimePqmvzr = 0;

  static B16AdHepJiwdjow get b16AdUtilsInstanceKqmvzr =>
      _b16AdUtilsInstancePqmvzr;

  final List<B16AdSceneJdwo> _b16StartupPreloadAdScenesVmqxtr =
      <B16AdSceneJdwo>[];
  final Set<B16AdSceneJdwo> _b16NoReloadAfterCloseAdScenesKqmvzr =
      <B16AdSceneJdwo>{B16AdSceneJdwo.pr_new_launch};
  final Map<B16AdSceneJdwo, Set<B16PosidJkwkosw>>
  _b16AdSceneAllowedPosIdsMapXmqvtr = <B16AdSceneJdwo, Set<B16PosidJkwkosw>>{
    B16AdSceneJdwo.pr_new_launch: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_new_open,
    },
    B16AdSceneJdwo.pr_launch: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_open_cold,
      B16PosidJkwkosw.pr_open_hot,
      B16PosidJkwkosw.pr_open_noti,
      B16PosidJkwkosw.pr_open_pop,
      B16PosidJkwkosw.pr_open_file,
      B16PosidJkwkosw.pr_open_mediapop,
      B16PosidJkwkosw.pr_permission_open,
    },
    B16AdSceneJdwo.pr_ban1: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_new_lan_nat,
      B16PosidJkwkosw.pr_main_banner1,
    },
    B16AdSceneJdwo.pr_ban2: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_main_banner2,
      B16PosidJkwkosw.unload_nat1,
    },
    B16AdSceneJdwo.pr_ban3: <B16PosidJkwkosw>{B16PosidJkwkosw.pr_main_banner3},
    B16AdSceneJdwo.pr_user_use: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_up_int,
      B16PosidJkwkosw.pr_down_int,
      B16PosidJkwkosw.pr_sc_pdf,
      B16PosidJkwkosw.pr_w_pdf,
      B16PosidJkwkosw.pr_img_pdf,
      B16PosidJkwkosw.pr_refresh,
      B16PosidJkwkosw.pr_search_int,
      B16PosidJkwkosw.pr_read_int,
    },
    B16AdSceneJdwo.pr_exit: <B16PosidJkwkosw>{
      B16PosidJkwkosw.pr_readback,
      B16PosidJkwkosw.pr_exit_app,
      B16PosidJkwkosw.unload_1,
      B16PosidJkwkosw.unload_2,
      B16PosidJkwkosw.pr_comment,
    },
  };

  Future<void> b16InitializeAdSdkPqmvzr() async {
    _b16BuildStartupPreloadSceneListXmqvtr();
    FlutterPdfAdPlugins.instance.setListener(this);
    FlutterPdfAdPlugins.instance.initializeAdmob();
    final UmpConsentResult b16UmpConsentResultKqmvzr = await FlutterPdfAdPlugins
        .instance
        .handleUmpConsent();
    if (!b16UmpConsentResultKqmvzr.canRequestAds) {
      return;
    }
    FlutterPdfAdPlugins.instance.updateDebugPaidRevenueRange(
      minRevenue: 0.0001,
      maxRevenue: 0.0003,
    );
    FlutterPdfAdPlugins.instance.updateInterstitialLikeNativePlacements(
      const <B16AdSceneJdwo>[B16AdSceneJdwo.pr_user_use],
    );
    FlutterPdfAdPlugins.instance.updateSmallTemplateNativePlacements(
      const <B16AdSceneJdwo>[
        B16AdSceneJdwo.pr_ban1,
        B16AdSceneJdwo.pr_ban2,
        B16AdSceneJdwo.pr_ban3,
      ],
    );
    FlutterPdfAdPlugins.instance.updateSkipReloadAfterClosePlacements(
      _b16NoReloadAfterCloseAdScenesKqmvzr,
    );
    await b16RefreshRemoteAdConfigKqmvzr();
    await FlutterPdfAdPlugins.instance.initPlugins(
      distinctId: await FlutterTbaInfo.instance.getDistinctId(),
      fengKongLogic: () {
        return false;
      },
      smallNativeAdLayoutName: 'b16_native_ad_layout',
    );
    await _b16PreloadStartupAdScenesVmqxtr();
  }

  Future<void> _b16PreloadStartupAdScenesVmqxtr() async {
    final List<Future<void>> b16StartupPreloadTasksPqmvzr =
        _b16StartupPreloadAdScenesVmqxtr
            .map(_b16PreloadAdScenePlacementPqmvzr)
            .toList(growable: false);
    await Future.wait(b16StartupPreloadTasksPqmvzr);
  }

  Future<void> _b16PreloadAdScenePlacementPqmvzr(
    B16AdSceneJdwo b16AdScenePqmvzr, {
    B16PosidJkwkosw? b16AdPosIdVmqxtr,
  }) async {
    final B16PosidJkwkosw b16ResolvedAdPosIdKqmvzr =
        b16AdPosIdVmqxtr ??
        _b16ResolveStartupPreloadPosIdKqmvzr(b16AdScenePqmvzr);
    if (!_b16CanUseAdScenePosIdPqmvzr(
      b16AdScenePqmvzr,
      b16ResolvedAdPosIdKqmvzr,
    )) {
      return;
    }
    try {
      await _b16LoadStartupAdSceneIgnoringShieldKqmvzr(b16AdScenePqmvzr);
    } catch (_) {
      return;
    }
  }

  Future<void> b16PreloadAdBySceneKqmwze(
    B16AdSceneJdwo b16AdSceneVqntza,
  ) async {
    await Future.wait(<Future<void>>[
      _b16PreloadAdScenePlacementPqmvzr(b16AdSceneVqntza),
    ]);
  }

  Future<Widget?> b16TakeFilesListNativeAdWidgetPqmvzr({
    bool b16LoadIfNeededPqmvzr = true,
    bool b16ReloadAfterTakePqmvzr = false,
    Duration b16DisposeDelayPqmvzr = const Duration(seconds: 2),
  }) async {
    return FlutterPdfAdPlugins.instance.takeCachedAdWidget<B16AdSceneJdwo>(
      B16AdSceneJdwo.pr_ban1,
      adPosId: B16PosidJkwkosw.pr_main_banner1,
      loadIfNeeded: b16LoadIfNeededPqmvzr,
      reloadAfterTake: b16ReloadAfterTakePqmvzr,
      disposeDelay: b16DisposeDelayPqmvzr,
    );
  }

  Future<Widget?> b16BuildCachedNativeAdWidgetPqmvzr({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) async {
    if (!_b16CanUseAdScenePosIdPqmvzr(b16AdScenePqmvzr, b16AdPosIdKqmvzr)) {
      return null;
    }
    return FlutterPdfAdPlugins.instance.buildCachedAdWidget<B16AdSceneJdwo>(
      b16AdScenePqmvzr,
      adPosId: b16AdPosIdKqmvzr,
    );
  }

  Future<bool> b16HasFilesListNativeAdPqmvzr() {
    return b16HasCachedSceneAdXmqvtr(
      b16AdScenePqmvzr: B16AdSceneJdwo.pr_ban1,
      b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_main_banner1,
    );
  }

  Future<void> b16RequestFilesListNativeAdPqmvzr() async {
    await FlutterPdfAdPlugins.instance.loadPlacement<B16AdSceneJdwo>(
      B16AdSceneJdwo.pr_ban1,
      force: true,
      placementLabelBuilder: (B16AdSceneJdwo b16AdScenePqmvzr) =>
          b16AdScenePqmvzr.name,
    );
  }

  Future<void> _b16LoadStartupAdSceneIgnoringShieldKqmvzr(
    B16AdSceneJdwo b16AdScenePqmvzr,
  ) async {
    if (b16AdScenePqmvzr != B16AdSceneJdwo.pr_ban2 &&b16AdScenePqmvzr != B16AdSceneJdwo.pr_exit) {
      await FlutterPdfAdPlugins.instance.loadPlacement<B16AdSceneJdwo>(
        b16AdScenePqmvzr,
        placementLabelBuilder: (B16AdSceneJdwo b16AdPlacementPqmvzr) =>
            b16AdPlacementPqmvzr.name,
      );
      return;
    }
    await FlutterPdfAdPlugins.instance.loadPlacement<B16AdSceneJdwo>(
      b16AdScenePqmvzr,
      placementLabelBuilder: (B16AdSceneJdwo b16AdPlacementPqmvzr) =>
          b16AdPlacementPqmvzr.name,
    );
  }

  bool _b16CanUseAdScenePosIdPqmvzr(
    B16AdSceneJdwo b16AdScenePqmvzr,
    B16PosidJkwkosw b16AdPosIdKqmvzr,
  ) {
    return _b16IsAdScenePosIdMatchedVmqxtr(b16AdScenePqmvzr, b16AdPosIdKqmvzr);
  }

  bool _b16IsAdScenePosIdMatchedVmqxtr(
    B16AdSceneJdwo b16AdScenePqmvzr,
    B16PosidJkwkosw b16AdPosIdKqmvzr,
  ) {
    final Set<B16PosidJkwkosw>? b16AllowedAdPosIdsVmqxtr =
        _b16AdSceneAllowedPosIdsMapXmqvtr[b16AdScenePqmvzr];
    if (b16AllowedAdPosIdsVmqxtr == null) {
      return true;
    }
    return b16AllowedAdPosIdsVmqxtr.contains(b16AdPosIdKqmvzr);
  }

  B16PosidJkwkosw _b16ResolveStartupPreloadPosIdKqmvzr(
    B16AdSceneJdwo b16AdScenePqmvzr,
  ) {
    final Set<B16PosidJkwkosw>? b16AllowedAdPosIdsVmqxtr =
        _b16AdSceneAllowedPosIdsMapXmqvtr[b16AdScenePqmvzr];
    if (b16AllowedAdPosIdsVmqxtr == null || b16AllowedAdPosIdsVmqxtr.isEmpty) {
      return _b16AdSceneAllowedPosIdsMapXmqvtr[b16AdScenePqmvzr]?.first ??
          B16PosidJkwkosw.pr_open_cold;
    }
    return b16AllowedAdPosIdsVmqxtr.first;
  }

  void _b16BuildStartupPreloadSceneListXmqvtr() {
    _b16StartupPreloadAdScenesVmqxtr.clear();
    _b16StartupPreloadAdScenesVmqxtr.add(B16AdSceneJdwo.pr_launch);
    _b16StartupPreloadAdScenesVmqxtr.add(B16AdSceneJdwo.pr_ban1);
    if (B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      _b16StartupPreloadAdScenesVmqxtr.add(B16AdSceneJdwo.pr_ban2);
      _b16StartupPreloadAdScenesVmqxtr.add(B16AdSceneJdwo.pr_exit);
    }
    b16LoadNewLaunchAdQxnvza =
        B16LoadNewLaunchAdStorageQxnvza.b16ReadEnabledKqmwze();
    if (b16LoadNewLaunchAdQxnvza) {
      B16LoadNewLaunchAdStorageQxnvza.b16SaveEnabledVqntza(false);
      _b16StartupPreloadAdScenesVmqxtr.add(B16AdSceneJdwo.pr_new_launch);
    }
  }

  Future<void> b16RefreshRemoteAdConfigKqmvzr() async {
    final dynamic b16AdConfigMapPqmvzr = await _b16LoadAdConfigMapKqmvzr();
    final Map<B16AdSceneJdwo, List<AdInfoBean>> b16ParsedAdConfigVmqxtr =
        <B16AdSceneJdwo, List<AdInfoBean>>{};
    if (b16AdConfigMapPqmvzr is Map) {
      b16AdConfigMapPqmvzr.forEach((
        dynamic b16ConfigSceneKeyPqmvzr,
        dynamic b16ConfigListValueKqmvzr,
      ) {
        final B16AdSceneJdwo? b16ConfigAdSceneVmqxtr =
            _b16FindAdSceneByConfigKeyPqmvzr('$b16ConfigSceneKeyPqmvzr');
        if (b16ConfigAdSceneVmqxtr == null ||
            b16ConfigListValueKqmvzr is! List) {
          return;
        }
        final List<AdInfoBean> b16SceneAdConfigsKqmvzr = b16ParsedAdConfigVmqxtr
            .putIfAbsent(b16ConfigAdSceneVmqxtr, () => <AdInfoBean>[]);
        for (final dynamic b16ConfigItemPqmvzr in b16ConfigListValueKqmvzr) {
          if (b16ConfigItemPqmvzr is! Map) {
            continue;
          }
          b16SceneAdConfigsKqmvzr.add(
            AdInfoBean.fromPlacementJson(
              Map<String, dynamic>.from(b16ConfigItemPqmvzr),
            ),
          );
        }
      });
    }
    FlutterPdfAdPlugins.instance.updateConfigs<B16AdSceneJdwo>(
      b16ParsedAdConfigVmqxtr,
      placementLabelBuilder: (B16AdSceneJdwo b16AdScenePqmvzr) =>
          b16AdScenePqmvzr.name,
    );
  }

  void b16UpdateFacebookAdConfigHqmwza(String b16PdfAdfbPqmvzr) {
    try {
      final dynamic b16AdConfigMapPqmvzr = jsonDecode(b16PdfAdfbPqmvzr);
      final Map<B16AdSceneJdwo, List<AdInfoBean>> b16ParsedAdConfigVmqxtr =
          <B16AdSceneJdwo, List<AdInfoBean>>{};
      if (b16AdConfigMapPqmvzr is Map) {
        b16AdConfigMapPqmvzr.forEach((
          dynamic b16ConfigSceneKeyPqmvzr,
          dynamic b16ConfigListValueKqmvzr,
        ) {
          final B16AdSceneJdwo? b16ConfigAdSceneVmqxtr =
              _b16FindAdSceneByConfigKeyPqmvzr('$b16ConfigSceneKeyPqmvzr');
          if (b16ConfigAdSceneVmqxtr == null ||
              b16ConfigListValueKqmvzr is! List) {
            return;
          }
          final List<AdInfoBean> b16SceneAdConfigsKqmvzr =
              b16ParsedAdConfigVmqxtr.putIfAbsent(
                b16ConfigAdSceneVmqxtr,
                () => <AdInfoBean>[],
              );
          for (final dynamic b16ConfigItemPqmvzr in b16ConfigListValueKqmvzr) {
            if (b16ConfigItemPqmvzr is! Map) {
              continue;
            }
            b16SceneAdConfigsKqmvzr.add(
              AdInfoBean.fromPlacementJson(
                Map<String, dynamic>.from(b16ConfigItemPqmvzr),
              ),
            );
          }
        });
      }
      FlutterPdfAdPlugins.instance.updateFacebookConfigs<B16AdSceneJdwo>(
        b16ParsedAdConfigVmqxtr,
        placementLabelBuilder: (B16AdSceneJdwo b16AdScenePqmvzr) =>
            b16AdScenePqmvzr.name,
      );
    } catch (_) {}
  }

  B16AdSceneJdwo? _b16FindAdSceneByConfigKeyPqmvzr(String b16ConfigKeyKqmvzr) {
    try {
      return B16AdSceneJdwo.values.byName(b16ConfigKeyKqmvzr);
    } catch (b16ErrorPqmvzr) {
      return null;
    }
  }

  Future<dynamic> _b16LoadAdConfigMapKqmvzr() async {
    try {
      final String b16StoredAdConfigVmqxtr =
          B16FirebaseAdConfigStorageHqmwza.b16ReadConfigKqnvxe();
      if (b16StoredAdConfigVmqxtr.isNotEmpty) {
        return jsonDecode(b16StoredAdConfigVmqxtr);
      }
      return jsonDecode(await _b16LoadLocalAdConfigTextVmqxtr());
    } catch (b16ErrorPqmvzr) {
      return jsonDecode(await _b16LoadLocalAdConfigTextVmqxtr());
    }
  }

  Future<String> _b16LoadLocalAdConfigTextVmqxtr() async {
    final String b16EncryptedLocalAdConfigPqmvzr = await rootBundle.loadString(
      B16LocalInfoFjeifjioe.localAdConfig,
    );
    return b16EncryptedLocalAdConfigPqmvzr;
  }

  Future<bool?> b16ShowCachedSceneAdPqmvzr({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
    BuildContext? b16AdHostContextVmqxtr,
    bool b16UploadChancePqnvze = true,
  }) async {
    if (FlutterPdfAdPlugins.instance.isShowingAd()) {
      return false;
    }
    if (!await b16CanShowAdBySwitchVqntza(b16AdPosIdKqmvzr)) {
      return false;
    }
    if (!_b16CanUseAdScenePosIdPqmvzr(b16AdScenePqmvzr, b16AdPosIdKqmvzr)) {
      debugPrint(
        'showAd _b16CanUseAdScenePosIdPqmvzr scene=$b16AdScenePqmvzr, posid=$b16AdPosIdKqmvzr',
      );
      return false;
    }
    if (!_b16ShouldExcludeCooldownForShow(
      b16AdScenePqmvzr: b16AdScenePqmvzr,
      b16AdPosIdKqmvzr: b16AdPosIdKqmvzr,
    )) {
      return false;
    }
    final int b16CurrentShowCachedSceneAdTimeVmqxtr =
        DateTime.now().millisecondsSinceEpoch;
    final int b16LastShowCachedSceneAdIntervalKqmvzr =
        _b16LastShowCachedSceneAdTimePqmvzr <= 0
        ? -1
        : b16CurrentShowCachedSceneAdTimeVmqxtr -
              _b16LastShowCachedSceneAdTimePqmvzr;
    _b16LastShowCachedSceneAdTimePqmvzr = b16CurrentShowCachedSceneAdTimeVmqxtr;
    if (b16UploadChancePqnvze) {
      b16UploadAdChanceKqnvxe(
        b16AdScenePqmvzr: b16AdScenePqmvzr,
        b16AdPosIdKqmvzr: b16AdPosIdKqmvzr,
      );
    }
    try {
      final bool b16HasCachedAdVmqxtr = await _b16HasCachedAdForSceneKqmvzr(
        b16AdScenePqmvzr: b16AdScenePqmvzr,
        b16AdPosIdKqmvzr: b16AdPosIdKqmvzr,
      );
      if (!b16HasCachedAdVmqxtr) {
        B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
          b16PointTypeQxnvza: B16PointTypeJdwijdiw.show_ad_no_cache,
          b16ParametersKqmwze: {
            "scene": b16AdScenePqmvzr.name,
            "ad_pos_id": b16AdPosIdKqmvzr.name,
            "last_time": b16LastShowCachedSceneAdIntervalKqmvzr,
          },
        );
        if (_b16NoReloadAfterCloseAdScenesKqmvzr.contains(b16AdScenePqmvzr)) {
          return false;
        }
        _b16PreloadAdScenePlacementPqmvzr(
          b16AdScenePqmvzr,
          b16AdPosIdVmqxtr: b16AdPosIdKqmvzr,
        );
        return false;
      }
      final BuildContext? b16ValidAdHostContextPqmvzr = b16AdHostContextVmqxtr;
      if (b16ValidAdHostContextPqmvzr != null &&
          !b16ValidAdHostContextPqmvzr.mounted) {
        return false;
      }
      final bool? b16DidShowCachedAdPqmvzr = await FlutterPdfAdPlugins.instance
          .showCachedAd<B16AdSceneJdwo>(
            b16AdScenePqmvzr,
            adPosId: b16AdPosIdKqmvzr,
            context: b16ValidAdHostContextPqmvzr,
          );
      return b16DidShowCachedAdPqmvzr;
    } catch (b16ErrorPqmvzr, b16StackTraceKqmvzr) {
      debugPrint(
        'show cached placement error: scene=$b16AdScenePqmvzr, error=$b16ErrorPqmvzr',
      );
      debugPrint(b16StackTraceKqmvzr.toString());
      return false;
    }
  }

  Future<bool> b16CanShowAdBySwitchVqntza(
    B16PosidJkwkosw b16AdPosIdKqmwze,
  ) async {
    try {
      String b16SwitchConfigPqnvze =
          B16AdSwitchStorageVqntza.b16ReadConfigKqmwze();
      if (b16SwitchConfigPqnvze.isEmpty) {
        b16SwitchConfigPqnvze = await rootBundle.loadString(
          B16LocalInfoFjeifjioe.localAdSwitch,
        );
      }
      final dynamic b16SwitchJsonQxnvza = jsonDecode(b16SwitchConfigPqnvze);
      if (b16SwitchJsonQxnvza is! Map<String, dynamic>) {
        return true;
      }
      final dynamic b16SwitchValueHqmwza =
          b16SwitchJsonQxnvza[b16AdPosIdKqmwze.name];
      return b16SwitchValueHqmwza != 0;
    } catch (_) {
      return true;
    }
  }

  void b16UploadAdChanceKqnvxe({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_chance,
      b16ParametersKqmwze: {
        "scene": b16AdScenePqmvzr.name,
        "ad_pos_id": b16AdPosIdKqmvzr.name,
      },
    );
  }

  Future<bool> b16HasCachedSceneAdXmqvtr({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) {
    return _b16HasCachedAdForSceneKqmvzr(
      b16AdScenePqmvzr: b16AdScenePqmvzr,
      b16AdPosIdKqmvzr: b16AdPosIdKqmvzr,
    );
  }

  Future<void> b16LoadBPackageAdRqmxza() async {
    if (!B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza) {
      return;
    }
    b16PreloadAdBySceneKqmwze(B16AdSceneJdwo.pr_exit);
    b16PreloadAdBySceneKqmwze(B16AdSceneJdwo.pr_ban2);
  }

  bool _b16ShouldExcludeCooldownForShow({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) {
    final String? b16CooldownKeyVmqxtr = _b16GetCooldownKeyPqmvzr(
      b16AdScenePqmvzr: b16AdScenePqmvzr,
      b16AdPosIdKqmvzr: b16AdPosIdKqmvzr,
    );
    if (b16CooldownKeyVmqxtr == null) {
      debugPrint(
        'showAd cooldown scene=${b16AdScenePqmvzr.name}, '
        'posid=${b16AdPosIdKqmvzr.name}, canShow=true, '
        'cooldownMs=0, intervalMs=-1, reason=no-cooldown',
      );
      return true;
    }
    final int b16LastShowTimeMsPqmvzr =
        B16LastAdShowTimeStoragePqnvze.b16ReadTimeKqmwze(b16CooldownKeyVmqxtr);
    final int b16CooldownMsKqmvzr =
        B16FirebaseHepKqmwze.instance.b16AdCooldownSecondsPqnvze * 1000;
    if (b16LastShowTimeMsPqmvzr <= 0) {
      debugPrint(
        'showAd cooldown scene=${b16AdScenePqmvzr.name}, '
        'posid=${b16AdPosIdKqmvzr.name}, canShow=true, '
        'cooldownKey=$b16CooldownKeyVmqxtr, '
        'cooldownMs=$b16CooldownMsKqmvzr, intervalMs=-1, '
        'reason=no-last-show',
      );
      return true;
    }
    final int b16NowMsVmqxtr = DateTime.now().millisecondsSinceEpoch;
    final int b16ShowIntervalMsPqmvzr =
        b16NowMsVmqxtr - b16LastShowTimeMsPqmvzr;
    final bool b16CanShowVmqxtr =
        b16ShowIntervalMsPqmvzr >= b16CooldownMsKqmvzr;
    debugPrint(
      'showAd cooldown scene=${b16AdScenePqmvzr.name}, '
      'posid=${b16AdPosIdKqmvzr.name}, canShow=$b16CanShowVmqxtr, '
      'cooldownKey=$b16CooldownKeyVmqxtr, '
      'cooldownMs=$b16CooldownMsKqmvzr, '
      'intervalMs=$b16ShowIntervalMsPqmvzr',
    );
    return b16CanShowVmqxtr;
  }

  String? _b16GetCooldownKeyPqmvzr({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) {
    if (b16AdScenePqmvzr == B16AdSceneJdwo.pr_user_use) {
      return b16AdScenePqmvzr.name;
    }
    if (b16AdScenePqmvzr == B16AdSceneJdwo.pr_exit &&
        b16AdPosIdKqmvzr == B16PosidJkwkosw.pr_readback) {
      return b16AdPosIdKqmvzr.name;
    }
    return null;
  }

  Future<bool> _b16HasCachedAdForSceneKqmvzr({
    required B16AdSceneJdwo b16AdScenePqmvzr,
    required B16PosidJkwkosw b16AdPosIdKqmvzr,
  }) async {
    if (!_b16IsAdScenePosIdMatchedVmqxtr(b16AdScenePqmvzr, b16AdPosIdKqmvzr)) {
      debugPrint(
        'HasAvailableCachedAd _b16IsAdScenePosIdMatchedVmqxtr scene=$b16AdScenePqmvzr, posid=$b16AdPosIdKqmvzr',
      );
      return false;
    }
    if (!_b16CanUseAdScenePosIdPqmvzr(b16AdScenePqmvzr, b16AdPosIdKqmvzr)) {
      return false;
    }
    try {
      final AdInfoBean? b16CachedAdInfoPqmvzr = await FlutterPdfAdPlugins
          .instance
          .getAvailableCachedAdInfo<B16AdSceneJdwo>(b16AdScenePqmvzr);
      return b16CachedAdInfoPqmvzr != null;
    } catch (b16ErrorPqmvzr, b16StackTraceKqmvzr) {
      debugPrint(
        'HasAvailableCachedAd catch scene=$b16AdScenePqmvzr, error=$b16ErrorPqmvzr',
      );
      debugPrint(b16StackTraceKqmvzr.toString());
      return false;
    }
  }

  @override
  void onAdClicked(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    Object b16AdPosIdVmqxtr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
  ) {
    B16NotificationHepPqnvze.instance.b16ShowAdClickNotificationKqnvxe();
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_click,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "ad_pos_id": b16AdPosIdVmqxtr.name,
        "ad_network": b16AdNetworkVmqxtr,
        "ad_source_client": b16AdSourceNamePqmvzr,
      },
    );
  }

  @override
  void onAdClosed(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    Object b16AdPosIdVmqxtr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_close,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "ad_pos_id": b16AdPosIdVmqxtr.name,
        "ad_network": b16AdNetworkVmqxtr,
        "ad_source_client": b16AdSourceNamePqmvzr,
      },
    );
  }

  @override
  void onAdPaidEvent(
    Object b16AdPlacementPqmvzr,
    Object b16AdPosIdVmqxtr,
    double b16RevenueKqmvzr,
    String b16CurrencyCodePqmvzr,
    String b16AdNetworkVmqxtr,
    String b16PrecisionTypeKqmvzr,
    AdInfoBean b16AdInfoPqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    if (b16RevenueKqmvzr >= 0.01) {
      B16FirebaseHepKqmwze.instance.b16LogAnalyticsEventVqntza(
        b16NameQxnvza: B16PointTypeJdwijdiw.pr_total_001_revenue.name,
      );
      B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
        b16PointTypeQxnvza: B16PointTypeJdwijdiw.pr_total_001_revenue,
        b16ParametersKqmwze: {
          "scene": b16AdPlacementPqmvzr.name,
          "ad_pos_id": b16AdPosIdVmqxtr.name,
          "ad_format": b16AdInfoPqmvzr.adType,
          "ad_code_id": b16AdInfoPqmvzr.adId,
          "currency": b16CurrencyCodePqmvzr,
          "value": b16RevenueKqmvzr,
          "ad_network": b16AdNetworkVmqxtr,
          "ad_source_client": b16AdInfoPqmvzr.adPlat,
        },
      );
    }

    FlutterCheckAf.instance.uploadAdRevenue(
      b16AdNetworkVmqxtr,
      b16RevenueKqmvzr,
      b16AdInfoPqmvzr.adId ?? "",
      b16AdPlacementPqmvzr.name,
      AFMediationNetwork.googleAdMob,
      b16CurrencyCodePqmvzr,
    );

    B16FirebaseHepKqmwze.instance.b16LogFacebookPurchaseKqmwze(
      b16RevenueKqmvzr,
      b16CurrencyCodePqmvzr,
    );

    B16FirebaseHepKqmwze.instance.b16LogAnalyticsEventVqntza(
      b16NameQxnvza: B16PointTypeJdwijdiw.ad_impression_revenue.name,
      b16ParametersKqmwze: {
        "currency": b16CurrencyCodePqmvzr,
        "value": b16RevenueKqmvzr,
      },
    );
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_impression_revenue,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_pos_id": b16AdPosIdVmqxtr.name,
        "ad_format": b16AdInfoPqmvzr.adType,
        "ad_code_id": b16AdInfoPqmvzr.adId,
        "currency": b16CurrencyCodePqmvzr,
        "value": b16RevenueKqmvzr,
        "ad_network": b16AdNetworkVmqxtr,
        "ad_source_client": b16AdInfoPqmvzr.adPlat,
      },
    );

    B16TbaHepDjiwjidw.instance.b16UploadAdHqmwza(
      b16AdInfoQxnvza: b16AdInfoPqmvzr,
      b16AdSceneKqmwze: b16AdPlacementPqmvzr,
      b16PositionIdVqntza: b16AdPosIdVmqxtr,
      b16RevenueHqmwza: b16RevenueKqmvzr,
      b16CurrencyPqnvze: b16CurrencyCodePqmvzr,
      b16AdNetworkKqnvxe: b16AdNetworkVmqxtr,
      b16PrecisionPqmxza: b16PrecisionTypeKqmvzr,
    );
  }

  @override
  void onAdRequestFailure(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    String b16FailReasonPqmvzr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNameKqmvzr,
    double loadDurationSeconds,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_load_fail,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "error_message": b16FailReasonPqmvzr,
        "ad_source_client": b16AdSourceNameKqmvzr,
        "ad_network": b16AdNetworkVmqxtr,
        "load_time": loadDurationSeconds,
      },
    );
  }

  @override
  void onAdRequestStart(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_request,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
      },
    );
  }

  @override
  void onAdRequestSuccess(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
    double loadDurationSeconds,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_load_success,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "ad_source_client": b16AdSourceNamePqmvzr,
        "ad_network": b16AdNetworkVmqxtr,
        "load_time": loadDurationSeconds,
      },
    );
  }

  @override
  void onAdShowFailure(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    Object b16AdPosIdVmqxtr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
    String b16ErrorMessageKqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_show_fail,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "ad_pos_id": b16AdPosIdVmqxtr.name,
        "ad_network": b16AdNetworkVmqxtr,
        "ad_source_client": b16AdSourceNamePqmvzr,
        "error_message": b16ErrorMessageKqmvzr,
      },
    );
  }

  @override
  void onAdShowStart(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    Object b16AdPosIdVmqxtr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    B16LauncherClickGateHepQxnvza.instance
        .b16MarkLauncherAdShownIfMatchedHqmwza(
          b16AdScenePqnvze: b16AdPlacementPqmvzr,
          b16AdPosIdKqmwze: b16AdPosIdVmqxtr,
        );
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ad_show,
      b16ParametersKqmwze: {
        "scene": b16AdPlacementPqmvzr.name,
        "ad_format": b16AdInfoKqmvzr.adType,
        "ad_code_id": b16AdInfoKqmvzr.adId,
        "ad_pos_id": b16AdPosIdVmqxtr.name,
        "ad_network": b16AdNetworkVmqxtr,
        "ad_source_client": b16AdSourceNamePqmvzr,
        "ad_source": b16AdSourceNamePqmvzr,
      },
    );
  }

  @override
  void onAdShowSuccess(
    Object b16AdPlacementPqmvzr,
    AdInfoBean b16AdInfoKqmvzr,
    Object b16AdPosIdVmqxtr,
    String b16AdNetworkVmqxtr,
    String b16AdSourceNamePqmvzr,
  ) {
    if (b16AdPlacementPqmvzr is! B16AdSceneJdwo) {
      return;
    }
    if (b16AdPosIdVmqxtr is! B16PosidJkwkosw) {
      return;
    }
    final String? b16CooldownKeyPqmvzr = _b16GetCooldownKeyPqmvzr(
      b16AdScenePqmvzr: b16AdPlacementPqmvzr,
      b16AdPosIdKqmvzr: b16AdPosIdVmqxtr,
    );
    if (b16CooldownKeyPqmvzr == null) {
      return;
    }
    B16LastAdShowTimeStoragePqnvze.b16SaveTimeVqntza(
      b16SceneKeyHqmwza: b16CooldownKeyPqmvzr,
      b16TimestampPqnvze: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  void onAdmobInitialized() {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.sdk_initialization,
    );
  }

  @override
  void onTachi25OneDayRevenueEvent(String b16EventNamePqmvzr) {}

  @override
  void onTachi25TotalRevenueEvent(String b16EventNamePqmvzr) {}

  @override
  void onUmpConsentCanRequestAds(bool b16CanRequestAdsPqmvzr) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.can_request_ads,
      b16ParametersKqmwze: {"canRequest": b16CanRequestAdsPqmvzr ? 1 : 0},
    );
  }

  @override
  void onUmpConsentFlowComplete(UmpConsentResult b16ResultPqmvzr) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.consent_status_update,
      b16ParametersKqmwze: {
        "countryCode": b16ResultPqmvzr.countryCode,
        "requiresCmpByLocale": b16ResultPqmvzr.requiresCmpByLocale,
        "purpose_ads": b16ResultPqmvzr.canRequestAds,
        "result": b16ResultPqmvzr.consentStatus.name,
        "privacyOptionsRequirementStatus":
            b16ResultPqmvzr.privacyOptionsRequirementStatus.name,
        "formError":
            "code:${b16ResultPqmvzr.formError?.errorCode},message:${b16ResultPqmvzr.formError?.message}",
      },
    );
  }

  @override
  void onUmpConsentFlowStart(
    String b16CountryCodePqmvzr,
    bool b16RequiresCmpByLocaleKqmvzr,
  ) {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.consent_flow_trigger,
      b16ParametersKqmwze: {
        "countryCode": b16CountryCodePqmvzr,
        "requiresCmp": b16RequiresCmpByLocaleKqmvzr,
      },
    );
  }

  @override
  void onUmpConsentFormShow() {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.consent_ui_show,
    );
  }

  @override
  void onUmpFormLoad() {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ump_form_load,
    );
  }

  @override
  void onUmpFormRequest() {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.ump_form_request,
    );
  }

  @override
  void onUserGroupResolved(int b16UserGroupPqmvzr) {
    B16TbaHepDjiwjidw.instance.addUserGroup(b16UserGroupPqmvzr);
  }
}

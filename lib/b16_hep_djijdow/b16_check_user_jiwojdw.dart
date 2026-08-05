import 'dart:convert';
import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_referrer_config_jdiwiw.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_adjust/callback/request_callback.dart';
import 'package:flutter_check_adjust/flutter_check_adjust.dart';
import 'package:flutter_check_adjust/request_adjust/request_adjust_callback.dart';
import 'package:flutter_check_adjust/request_cloak/request_cloak_callback.dart';
import 'package:flutter_check_adjust/request_referrer/request_referrer_callback.dart';
import 'package:flutter_pdf_risk_control_plugins/flutter_pdf_risk_control_plugins.dart';
import 'package:flutter_pdf_risk_control_plugins/models/flutter_pdf_risk_control_ip_config.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B16CheckUserJiwojdw{
  static final B16CheckUserJiwojdw _b16checkUserJiwojdw=B16CheckUserJiwojdw();
  static B16CheckUserJiwojdw get instance => _b16checkUserJiwojdw;

  bool _b12allIsBUserPqmvzr = false;

  bool get isBUser {
    if (kDebugMode) {
      return true;
    }
    return _b12allIsBUserPqmvzr;
  }

  Future<void> b12allInitAdjustKqmvzr() async {
    b12allSetReferrerConfigVmqxtr();
    b12allRefreshBUserStatePqmvzr();
    final String b12allDistinctIdKqmvzr = await FlutterTbaInfo.instance.getDistinctId();
    FlutterCheckAdjust.instance.init(
      adjustAppToken: B16LocalInfoFjeifjioe.adjustToken,
      distinctId: b12allDistinctIdKqmvzr,
      clockUrl: B16LocalInfoFjeifjioe.clockUrl,
      cloakWhiteKey: 'claw',
      cloakData: <String, dynamic>{
        'baggage': await FlutterTbaInfo.instance.getBundleId(),
        'proper': Platform.isAndroid ? 'hotelman' : 'octoroon',
        'braille': await FlutterTbaInfo.instance.getAppVersion(),
        'secular': b12allDistinctIdKqmvzr,
        'germinal': DateTime.now().millisecondsSinceEpoch,
      },
      requestCallback: RequestCallback(
        requestAdjustCallback: RequestAdjustCallback(
          startRequestAdjust: () {
            // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(b12allPointNameKqmvzr: B12allPointFhifhe.adj_req);
          },
          requestSuccess: (bool b12allIsBKqmvzr, String b12allNetworkVmqxtr) {
            // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
            //   b12allPointNameKqmvzr: B12allPointFhifhe.adj_suc,
            //   b12allParamsVmqxtr: {
            //     //adj_user：【0】【1】，对应【黑名单用户】【自然量用户】
            //     "adj_user":b12allIsBKqmvzr?1:0,
            //     "network":b12allNetworkVmqxtr,
            //   },
            // );
            // FlutterPdfAdPlugins.instance.updateAdjustAttribution(
            //   network: b12allNetworkVmqxtr,
            // );
            // b12allRefreshBUserStatePqmvzr();
          },
          firstRequestAdjustB: () {},
        ),
        requestCloakCallback: RequestCloakCallback(
          startRequestCloak: () {
            // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(b12allPointNameKqmvzr: B12allPointFhifhe.cloak_req);
          },
          requestSuccess: (bool b12allIsWhiteKqmvzr) {
            // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
            //   b12allPointNameKqmvzr: B12allPointFhifhe.cloak_suc,
            //   b12allParamsVmqxtr: {
            //     //cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
            //     "cloak_user":b12allIsWhiteKqmvzr?1:0,
            //   },
            // );
            // b12allRefreshBUserStatePqmvzr();
          },
        ),
        requestReferrerCallback: RequestReferrerCallback(
          startRequestReferrer: () {
            // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(b12allPointNameKqmvzr: B12allPointFhifhe.referrer_req);
          },
          requestSuccess: (String b12allReferrerVmqxtr) {
            // _uploadReferrerResult(b12allReferrerVmqxtr);
            // FlutterPdfAdPlugins.instance.updateInstallReferrer(
            //   referrer: b12allReferrerVmqxtr,
            // );
            // b12allRefreshBUserStatePqmvzr();
          },
        ),
      ),
    );
  }

  Future<void> b12allInitRiskVmqxtr(String b12allRiskControlKqmvzr) async {
    // FlutterPdfRiskControlPlugins.instance.initPdfRiskControl(
    //   riskConfigJson: b12allRiskControlKqmvzr,
    //   ipConfig: FlutterPdfRiskControlIpConfig(
    //     requestUrl: 'https://ip-prod.apexpdftool.com/api/cpanda',
    //     requestData: <String, String>{
    //       'acat': await FlutterTbaInfo.instance.getAndroidId(),
    //     },
    //     riskResultKey: 'bshark',
    //     decryptCode: 56,
    //   ),
    //   callback: FlutterPdfRiskControlCallback(
    //     onUploadSessionRisk: (Map<String, int> b12allRiskMapPqmvzr) {},
    //     onPdfRiskDetected: (FlutterPdfRiskControlTag b12allTagKqmvzr) {
    //       B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
    //         b12allPointNameKqmvzr: B12allPointFhifhe.risk_control,
    //         //type：vpn、root、sim、simulator、googleplay、developer、ip
    //         b12allParamsVmqxtr: {"risk_type":b12allTagKqmvzr.name},
    //       );
    //       b12allRefreshBUserStatePqmvzr();
    //     },
    //   ),
    // );
  }

  Future<void> b12allSetReferrerConfigVmqxtr() async {
    try {
      final String b12allDataKqmvzr = await b12allGetReferrerStrPqmvzr();
      final dynamic b12allJsonVmqxtr = jsonDecode(b12allDataKqmvzr);
      final dynamic b12allIlvePqmvzr = b12allJsonVmqxtr['ilve'];
      final List<String> b12allReferrerListKqmvzr = <String>[];
      if (b12allIlvePqmvzr is List) {
        for (final dynamic b12allValueVmqxtr in b12allIlvePqmvzr) {
          if (b12allValueVmqxtr is String) {
            b12allReferrerListKqmvzr.add(b12allValueVmqxtr);
          }
        }
      }
      FlutterCheckAdjust.instance.updateReferrerList(
        b12allJsonVmqxtr['door'] == 0,
        b12allReferrerListKqmvzr,
      );
    } catch (_) {
    }
  }

  Future<String> b12allGetReferrerStrPqmvzr() async {
    final String b12allConfigVmqxtr = B16ReferrerConfigJdiwiw.b16ReadVqmxpe();
    if (b12allConfigVmqxtr.isNotEmpty) {
      return b12allConfigVmqxtr;
    }
    return rootBundle.loadString(B16LocalInfoFjeifjioe.localReferrerConfig);
  }

  void b12allRefreshBUserStatePqmvzr() {
    final bool b12allCheckUserKqmvzr = FlutterCheckAdjust.instance.checkUser();
    final bool b12allHasSavedPdfRiskVmqxtr = FlutterPdfRiskControlPlugins
        .instance
        .hasSavedPdfRisk();
    if (kDebugMode) {
      debugPrint(
        'refresh_b_user_state checkUser:$b12allCheckUserKqmvzr '
            'hasSavedPdfRisk:$b12allHasSavedPdfRiskVmqxtr',
      );
    }
    final bool b12allNewUserStatePqmvzr = b12allCheckUserKqmvzr && !b12allHasSavedPdfRiskVmqxtr;
    // B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.addUserBV(b12allNewUserStatePqmvzr);
    // if (_b12allIsBUserPqmvzr == b12allNewUserStatePqmvzr) {
    //   return;
    // }
    // _b12allIsBUserPqmvzr = b12allNewUserStatePqmvzr;
    // B12allEventUtilsRymfpa.b12allInstanceNqewlz.b12allSendCodeNmkjwb(
    //   b12allCodeHtwqre: B12allEventCodeXpnlud.b12allRefreshBUserStatePqmvzr,
    //   b12allDataFjrzmp: b12allNewUserStatePqmvzr,
    // );
    // B12allNotificationUtilsFjiejfie.instance.b12allInitNotificationPqmvzr();
    // B12allOverlayUtilsFjeoje.instance.b12allInitOverlayInfoPqmvzr();
    // B12allAdUtilsFjiefje.b12allAdUtilsInstanceKqmvzr.b12allLoadBPackageAd();
  }

  Future<void> _uploadReferrerResult(String referrer) async {
    // try {
    //   final String configText = await b12allGetReferrerStrPqmvzr();
    //   final dynamic json = jsonDecode(configText);
    //   final dynamic ilve = json["ilve"];
    //   if (ilve is List) {
    //     int referrerUser = 0;
    //     for (final dynamic value in ilve) {
    //       if (value is String && referrer.contains(value)) {
    //         referrerUser = 1;
    //         break;
    //       }
    //     }
    //     B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
    //       b12allPointNameKqmvzr: B12allPointFhifhe.reffer,
    //       b12allParamsVmqxtr: {
    //         "reffer_info":referrer,
    //         "reffer_user":referrerUser
    //       },
    //     );
    //   } else {
    //     B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
    //       b12allPointNameKqmvzr: B12allPointFhifhe.reffer,
    //       b12allParamsVmqxtr: {
    //         "reffer_info":referrer,
    //         "reffer_user":"list is empty"
    //       },
    //     );
    //   }
    // } catch (e) {
    //   B12allTbaUtilsFjeifjeo.b12allInstanceVmqxtr.b12allUploadPointEventPqmvzr(
    //     b12allPointNameKqmvzr: B12allPointFhifhe.reffer,
    //     b12allParamsVmqxtr: {
    //       "reffer_info":referrer,
    //       "reffer_user":"error"
    //     },
    //   );
    // }
  }
}
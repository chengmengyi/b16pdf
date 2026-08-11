import 'dart:convert';
import 'dart:io';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_hep_fjiejizx.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_notification_hep_djiwdow/b16_notification_hep_jsowkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_referrer_config_jdiwiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_check_af_new/callback/request_callback.dart';
import 'package:flutter_check_af_new/flutter_check_af_new.dart';
import 'package:flutter_check_af_new/request_af/request_af_callback.dart';
import 'package:flutter_check_af_new/request_cloak/request_cloak_callback.dart';
import 'package:flutter_check_af_new/request_referrer/request_referrer_callback.dart';
import 'package:flutter_pdf_ad_plugins/flutter_pdf_ad_plugins.dart';
import 'package:flutter_pdf_risk_control_plugins/callbacks/flutter_pdf_risk_control_callback.dart';
import 'package:flutter_pdf_risk_control_plugins/flutter_pdf_risk_control_plugins.dart';
import 'package:flutter_pdf_risk_control_plugins/models/flutter_pdf_risk_control_ip_config.dart';
import 'package:flutter_pdf_risk_control_plugins/utils/flutter_pdf_risk_control_tag.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B16UserCheckHepQxnvza {
  B16UserCheckHepQxnvza._();
  static final B16UserCheckHepQxnvza instance = B16UserCheckHepQxnvza._();

  bool _b16IsEligibleUserKqmwze = false;

  bool get b16IsEligibleUserVqntza {
    // if (kDebugMode) {
    //   return true;
    // }
    return _b16IsEligibleUserKqmwze;
  }

  Future<void> b16InitializeAttributionHqmwza() async {
    b16ApplyReferrerConfigPqnvze();
    b16RefreshUserStateVqntza();
    final String b16DistinctIdQxnvza = await FlutterTbaInfo.instance
        .getDistinctId();
    FlutterCheckAf.instance.init(
      afKey: B16LocalInfoFjeifjioe.afKey,
      afAppId: "",
      distinctId: b16DistinctIdQxnvza,
      clockUrl: B16LocalInfoFjeifjioe.clockUrl,
      cloakWhiteKey: 'claw',
      cloakData: <String, dynamic>{
        'baggage': await FlutterTbaInfo.instance.getBundleId(),
        'proper': Platform.isAndroid ? 'hotelman' : 'octoroon',
        'braille': await FlutterTbaInfo.instance.getAppVersion(),
        'secular': b16DistinctIdQxnvza,
        'germinal': DateTime.now().millisecondsSinceEpoch,
      },
      requestCallback: RequestCallback(
        requestAfCallback: RequestAfCallback(
          startRequestAf: (){
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.af_req);
          },
          requestSuccess: (bool b12allIsBKqmvzr,String afStr){
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
              b16PointTypeQxnvza: B16PointTypeJdwijdiw.af_suc,
              b16ParametersKqmwze: {
                //adj_user：【0】【1】，对应【黑名单用户】【自然量用户】
                "af_user":b12allIsBKqmvzr?1:0,
                "af_info":afStr,
              },
            );
            FlutterPdfAdPlugins.instance.updateAdjustAttribution(
              network: afStr,
            );
            b16RefreshUserStateVqntza();
          },
          firstRequestAfB: (){

          },
          startAfSuccess: (){
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
              b16PointTypeQxnvza: B16PointTypeJdwijdiw.start_af_suc,
            );
          },
          startAfFail: (int code,String msg){
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
              b16PointTypeQxnvza: B16PointTypeJdwijdiw.start_af_fail,
              b16ParametersKqmwze: {
                "code":code,
                "msg":msg,
              },
            );
          },
        ),
        requestCloakCallback: RequestCloakCallback(
          startRequestCloak: () {
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.cloak_req);
          },
          requestSuccess: (bool b12allIsWhiteKqmvzr) {
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
              b16PointTypeQxnvza: B16PointTypeJdwijdiw.cloak_suc,
              b16ParametersKqmwze: {
                //cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
                "cloak_user":b12allIsWhiteKqmvzr?1:0,
              },
            );
            b16RefreshUserStateVqntza();
          },
        ),
        requestReferrerCallback: RequestReferrerCallback(
          startRequestReferrer: () {
            B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(b16PointTypeQxnvza: B16PointTypeJdwijdiw.referrer_req);
          },
          requestSuccess: (String b12allReferrerVmqxtr) {
            _uploadReferrerResult(b12allReferrerVmqxtr);
            FlutterPdfAdPlugins.instance.updateInstallReferrer(
              referrer: b12allReferrerVmqxtr,
            );
            b16RefreshUserStateVqntza();
          },
        ),
      ),
    );
  }

  Future<void> b16InitializeRiskControlKqmwze(
    String b16RiskConfigQxnvza,
  ) async {
    FlutterPdfRiskControlPlugins.instance.initPdfRiskControl(
      riskConfigJson: b16RiskConfigQxnvza,
      ipConfig: FlutterPdfRiskControlIpConfig(
        requestUrl: 'https://ip-prod.pdfeditorpaperforge.com/api/cshark',
        requestData: <String, String>{
          'awolf': await FlutterTbaInfo.instance.getAndroidId(),
        },
        riskResultKey: 'bcat',
        decryptCode: 62,
      ),
      callback: FlutterPdfRiskControlCallback(
        onUploadSessionRisk: (Map<String, int> b12allRiskMapPqmvzr) {},
        onPdfRiskDetected: (FlutterPdfRiskControlTag b12allTagKqmvzr) {
          B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
            b16PointTypeQxnvza: B16PointTypeJdwijdiw.risk_control,
            //type：vpn、root、sim、simulator、googleplay、developer、ip
            b16ParametersKqmwze: {"risk_type":b12allTagKqmvzr.name},
          );
          b16RefreshUserStateVqntza();
        },
      ),
    );
  }

  Future<void> b16ApplyReferrerConfigPqnvze() async {
    try {
      final String b16ConfigTextQxnvza = await b16LoadReferrerConfigKqmwze();
      final dynamic b16ConfigJsonVqntza = jsonDecode(b16ConfigTextQxnvza);
      final dynamic b16ReferrerValuesHqmwza = b16ConfigJsonVqntza['ilve'];
      final List<String> b16ReferrerListPqnvze = <String>[];
      if (b16ReferrerValuesHqmwza is List) {
        for (final dynamic b16ValueQxnvza in b16ReferrerValuesHqmwza) {
          if (b16ValueQxnvza is String) {
            b16ReferrerListPqnvze.add(b16ValueQxnvza);
          }
        }
      }
      FlutterCheckAf.instance.updateReferrerList(
        b16ConfigJsonVqntza['door'] == 0,
        b16ReferrerListPqnvze,
      );
    } catch (_) {}
  }

  Future<String> b16LoadReferrerConfigKqmwze() async {
    final String b16StoredConfigQxnvza =
        B16ReferrerConfigJdiwiw.b16ReadVqmxpe();
    if (b16StoredConfigQxnvza.isNotEmpty) {
      return b16StoredConfigQxnvza;
    }
    return rootBundle.loadString(B16LocalInfoFjeifjioe.localReferrerConfig);
  }

  void b16RefreshUserStateVqntza() {
    final bool b16CheckResultQxnvza = FlutterCheckAf.instance.checkUser();
    final bool b16HasSavedRiskKqmwze = FlutterPdfRiskControlPlugins.instance
        .hasSavedPdfRisk();
    if (kDebugMode) {
      debugPrint(
        'refresh_b_user_state checkUser:$b16CheckResultQxnvza '
        'hasSavedPdfRisk:$b16HasSavedRiskKqmwze',
      );
    }
    final bool b12allNewUserStatePqmvzr = b16CheckResultQxnvza && !b16HasSavedRiskKqmwze;
    B16TbaHepDjiwjidw.instance.addUserBV(b12allNewUserStatePqmvzr);
    if (_b16IsEligibleUserKqmwze == b12allNewUserStatePqmvzr) {
      return;
    }
    _b16IsEligibleUserKqmwze = b12allNewUserStatePqmvzr;
    B16EventHepFjiejizx.instance.b16SendMsgFjijeio(B16EventBeanFhifeode(b16EventCodeFhfemie: B16EventCodeQxmvza.b16RefreshBUserStatePqmvzr,b16BoolValuefwjijiw: b12allNewUserStatePqmvzr));

    B16NotificationHepPqnvze.instance.b16InitializeNotificationsQxnvza();
    B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16LoadBPackageAdRqmxza();
  }

  Future<void> _uploadReferrerResult(String referrer) async {
    try {
      final String configText = await b16LoadReferrerConfigKqmwze();
      final dynamic json = jsonDecode(configText);
      final dynamic ilve = json["ilve"];
      if (ilve is List) {
        int referrerUser = 0;
        for (final dynamic value in ilve) {
          if (value is String && referrer.contains(value)) {
            referrerUser = 1;
            break;
          }
        }
        B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
          b16PointTypeQxnvza: B16PointTypeJdwijdiw.reffer_suc,
          b16ParametersKqmwze: {
            "reffer_info":referrer,
            "reffer_user":referrerUser
          },
        );
      } else {
        B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
          b16PointTypeQxnvza: B16PointTypeJdwijdiw.reffer_suc,
          b16ParametersKqmwze: {
            "reffer_info":referrer,
            "reffer_user":"list is empty"
          },
        );
      }
    } catch (e) {
      B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
        b16PointTypeQxnvza: B16PointTypeJdwijdiw.reffer_suc,
        b16ParametersKqmwze: {
          "reffer_info":referrer,
          "reffer_user":"error"
        },
      );
    }
  }
}

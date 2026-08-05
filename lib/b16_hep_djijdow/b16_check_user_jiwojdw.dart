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
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B16UserCheckHepQxnvza {
  B16UserCheckHepQxnvza._();
  static final B16UserCheckHepQxnvza instance = B16UserCheckHepQxnvza._();

  final bool _b16IsEligibleUserKqmwze = false;

  bool get b16IsEligibleUserVqntza {
    if (kDebugMode) {
      return true;
    }
    return _b16IsEligibleUserKqmwze;
  }

  Future<void> b16InitializeAttributionHqmwza() async {
    b16ApplyReferrerConfigPqnvze();
    b16RefreshUserStateVqntza();
    final String b16DistinctIdQxnvza = await FlutterTbaInfo.instance
        .getDistinctId();
    FlutterCheckAdjust.instance.init(
      adjustAppToken: B16LocalInfoFjeifjioe.adjustToken,
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
        requestAdjustCallback: RequestAdjustCallback(
          startRequestAdjust: () {},
          requestSuccess: (bool b16EligibleQxnvza, String b16NetworkVqntza) {},
          firstRequestAdjustB: () {},
        ),
        requestCloakCallback: RequestCloakCallback(
          startRequestCloak: () {},
          requestSuccess: (bool b16WhitelistedQxnvza) {},
        ),
        requestReferrerCallback: RequestReferrerCallback(
          startRequestReferrer: () {},
          requestSuccess: (String b16ReferrerQxnvza) {},
        ),
      ),
    );
  }

  Future<void> b16InitializeRiskControlKqmwze(
    String b16RiskConfigQxnvza,
  ) async {}

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
      FlutterCheckAdjust.instance.updateReferrerList(
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
    final bool b16CheckResultQxnvza = FlutterCheckAdjust.instance.checkUser();
    final bool b16HasSavedRiskKqmwze = FlutterPdfRiskControlPlugins.instance
        .hasSavedPdfRisk();
    if (kDebugMode) {
      debugPrint(
        'refresh_b_user_state checkUser:$b16CheckResultQxnvza '
        'hasSavedPdfRisk:$b16HasSavedRiskKqmwze',
      );
    }
  }
}

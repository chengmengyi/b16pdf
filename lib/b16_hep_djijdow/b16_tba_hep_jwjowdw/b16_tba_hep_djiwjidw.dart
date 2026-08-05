import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_upload_install_event_storage_qxnvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pdf_ad_plugins/bean/ad_info_bean.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class B16TbaHepDjiwjidw {
  B16TbaHepDjiwjidw._();

  static final B16TbaHepDjiwjidw _b16InstanceQxnvza = B16TbaHepDjiwjidw._();
  static B16TbaHepDjiwjidw get instance => _b16InstanceQxnvza;

  final Dio _b16DioClientKqmwze = Dio();

  Future<void> b16UploadInstallQxnvza() async {
    b16UploadSessionVqntza();
    if (!B16UploadInstallEventStorageQxnvza.b16ReadEnabledKqmwze()) {
      return;
    }

    final Map<String, dynamic> b16RequestBodyVqntza =
        await _b16CreateCommonBodyHqmwza();
    final Map<dynamic, dynamic> b16ReferrerDataPqnvze = await FlutterTbaInfo
        .instance
        .getReferrerMap();
    b16RequestBodyVqntza['incant'] = <String, dynamic>{
      'annul': b16ReferrerDataPqnvze['build'],
      'gambol': b16ReferrerDataPqnvze['referrer_url'],
      'aunt': b16ReferrerDataPqnvze['install_version'],
      'iodide': b16ReferrerDataPqnvze['user_agent'],
      'mayapple': 'starr',
      'drama': b16ReferrerDataPqnvze['referrer_click_timestamp_seconds'],
      'moderate': b16ReferrerDataPqnvze['install_begin_timestamp_seconds'],
      'ne': b16ReferrerDataPqnvze['referrer_click_timestamp_server_seconds'],
      'cindy': b16ReferrerDataPqnvze['install_begin_timestamp_server_seconds'],
      'emerson': b16ReferrerDataPqnvze['install_first_seconds'],
      'junctor': b16ReferrerDataPqnvze['last_update_seconds'],
    };

    final bool b16UploadedKqnvxe = await _b16PostWithRetryPqmxza(
      b16BodyHqmwze: b16RequestBodyVqntza,
      b16EventTypeKqmwze: 'install',
      b16EventNameVqntza: 'install',
    );
    if (b16UploadedKqnvxe) {
      await B16UploadInstallEventStorageQxnvza.b16SaveEnabledVqntza(false);
    }
  }

  Future<void> b16UploadSessionVqntza() async {
    final Map<String, dynamic> b16RequestBodyHqmwza =
        await _b16CreateCommonBodyHqmwza();
    b16RequestBodyHqmwza['gorilla'] = <String, dynamic>{};
    await _b16PostWithRetryPqmxza(
      b16BodyHqmwze: b16RequestBodyHqmwza,
      b16EventTypeKqmwze: 'session',
      b16EventNameVqntza: 'session',
    );
  }

  Future<void> b16UploadAdHqmwza({
    required AdInfoBean b16AdInfoQxnvza,
    required B16AdSceneJdwo b16AdSceneKqmwze,
    required B16PosidJkwkosw? b16PositionIdVqntza,
    required double b16RevenueHqmwza,
    required String b16CurrencyPqnvze,
    required String b16AdNetworkKqnvxe,
    required String b16PrecisionPqmxza,
  }) async {
    final Map<String, dynamic> b16RequestBodyVqntze =
        await _b16CreateCommonBodyHqmwza();
    b16RequestBodyVqntze['jug'] = <String, dynamic>{
      'amtrak': b16RevenueHqmwza * 1000000,
      'culpable': b16CurrencyPqnvze,
      'cushion': b16AdNetworkKqnvxe,
      'criss': b16AdInfoQxnvza.adPlat ?? '',
      'standard': b16AdInfoQxnvza.adId ?? '',
      'rant': b16PositionIdVqntza?.name ?? '',
      'leisure': b16AdSceneKqmwze.name,
      'lord': b16PrecisionPqmxza,
      'ideate': b16AdInfoQxnvza.adType,
    };
    await _b16PostWithRetryPqmxza(
      b16BodyHqmwze: b16RequestBodyVqntze,
      b16EventTypeKqmwze: 'ad',
      b16EventNameVqntza: b16AdSceneKqmwze.name,
    );
  }

  Future<void> b16UploadPointKqnvxe({
    required B16PointTypeJdwijdiw b16PointTypeQxnvza,
    Map<String, dynamic>? b16ParametersKqmwze,
    Map<String, dynamic>? b16UserGroupVqntza,
  }) async {
    final Map<String, dynamic> b16RequestBodyHqmwze =
        await _b16CreateCommonBodyHqmwza();
    b16RequestBodyHqmwze['rove'] = b16PointTypeQxnvza.name;
    b16ParametersKqmwze?.forEach((String b16KeyPqnvze, dynamic b16ValueKqnvxe) {
      b16RequestBodyHqmwze['vaccine~$b16KeyPqnvze'] = b16ValueKqnvxe;
    });
    await _b16PostWithRetryPqmxza(
      b16BodyHqmwze: b16RequestBodyHqmwze,
      b16EventTypeKqmwze: 'point',
      b16EventNameVqntza: b16PointTypeQxnvza.name,
    );
  }

  Future<Map<String, dynamic>> getPushPointBody()async{
    final Map<String, dynamic> b16RequestBodyHqmwze = await _b16CreateCommonBodyHqmwza();
    b16RequestBodyHqmwze['rove'] = B16PointTypeJdwijdiw.push.name;
    b16RequestBodyHqmwze['vaccine~sourse'] = "local";
    return b16RequestBodyHqmwze;
  }

  Future<bool> _b16PostWithRetryPqmxza({
    required Map<String, dynamic> b16BodyHqmwze,
    required String b16EventTypeKqmwze,
    required String b16EventNameVqntza,
  }) async {
    final Map<String, dynamic> b16HeadersVqntza =
        await b16CreateHeadersKqnvxe();
    final String b16RequestUrlPqnvze = await b16CreateUrlVqntza();

    for (int b16AttemptQxnvza = 1; b16AttemptQxnvza <= 5; b16AttemptQxnvza++) {
      try {
        debugPrint(
          'tba-$b16EventTypeKqmwze-$b16EventNameVqntza-'
          '请求前-$b16BodyHqmwze-',
        );
        final Response<dynamic> b16ResponseKqmwze = await _b16DioClientKqmwze
            .post<dynamic>(
              b16RequestUrlPqnvze,
              data: b16BodyHqmwze,
              options: Options(
                headers: b16HeadersVqntza,
                contentType: Headers.jsonContentType,
              ),
            );
        final int? b16StatusCodeVqntza = b16ResponseKqmwze.statusCode;
        if (b16StatusCodeVqntza != null &&
            b16StatusCodeVqntza >= 200 &&
            b16StatusCodeVqntza < 300) {
          debugPrint(
            'tba-$b16EventTypeKqmwze-$b16EventNameVqntza-'
            '请求结果-true-$b16BodyHqmwze-${b16ResponseKqmwze.data}',
          );
          return true;
        }
        debugPrint(
          'tba-$b16EventTypeKqmwze-$b16EventNameVqntza-'
          '请求结果-false-$b16BodyHqmwze-${b16ResponseKqmwze.data}',
        );
      } catch (b16RequestErrorPqnvze) {
        debugPrint(
          'tba-$b16EventTypeKqmwze-$b16EventNameVqntza-'
          '请求结果-false-$b16BodyHqmwze-$b16RequestErrorPqnvze',
        );
      }

      if (b16AttemptQxnvza < 5) {
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
    return false;
  }

  Future<Map<String, dynamic>> _b16CreateCommonBodyHqmwza() async {
    return <String, dynamic>{
      'weco': <String, dynamic>{
        'baggage': await FlutterTbaInfo.instance.getBundleId(),
        'proper': Platform.isAndroid ? 'hotelman' : 'octoroon',
        'germinal': DateTime.now().millisecondsSinceEpoch,
        'tardy': await FlutterTbaInfo.instance.getNetworkType(),
        'vivaldi': await FlutterTbaInfo.instance.getIdfa(),
      },
      'cannibal': <String, dynamic>{
        'braille': await FlutterTbaInfo.instance.getAppVersion(),
        'fall': await FlutterTbaInfo.instance.getBrand(),
        'awkward': await FlutterTbaInfo.instance.getDeviceModel(),
        'modulus': await FlutterTbaInfo.instance.getOperator(),
        'cornish': await FlutterTbaInfo.instance.getSystemLanguage(),
        'aurelius': await FlutterTbaInfo.instance.getAndroidId(),
      },
      'yew': <String, dynamic>{
        'secular': await FlutterTbaInfo.instance.getDistinctId(),
        'sorority': await FlutterTbaInfo.instance.getLogId(),
        'moreover': await FlutterTbaInfo.instance.getManufacturer(),
        'gao': await FlutterTbaInfo.instance.getOsVersion(),
        'ogre': await FlutterTbaInfo.instance.getIdfv(),
        'dana': await FlutterTbaInfo.instance.getGaid(),
        'anderson': await FlutterTbaInfo.instance.getOsCountry(),
      },
    };
  }

  Future<Map<String, String>> b16CreateHeadersKqnvxe() async {
    return <String, String>{
      'ogre': await FlutterTbaInfo.instance.getIdfv(),
      'baggage': await FlutterTbaInfo.instance.getBundleId(),
    };
  }

  Future<String> b16CreateUrlVqntza() async {
    final String b16BundleIdQxnvza = await FlutterTbaInfo.instance
        .getBundleId();
    final String b16BrandKqmwze = await FlutterTbaInfo.instance.getBrand();
    return '${B16LocalInfoFjeifjioe.tbaUrl}?baggage=$b16BundleIdQxnvza&fall=$b16BrandKqmwze';
  }
}

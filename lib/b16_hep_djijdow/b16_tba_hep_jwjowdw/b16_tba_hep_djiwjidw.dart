import 'dart:io';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:flutter_pdf_ad_plugins/bean/ad_info_bean.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

import '../b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart' show B16PosidJkwkosw;

class B16TbaHepDjiwjidw{
  static final B16TbaHepDjiwjidw _b16tbaHepDjiwjidw=B16TbaHepDjiwjidw();
  static B16TbaHepDjiwjidw get instance => _b16tbaHepDjiwjidw;

  install()async{
    var commonMap = await _createCommonMap();
    var referrerMap = await FlutterTbaInfo.instance.getReferrerMap();
    commonMap["incant"]={
      "annul":referrerMap["build"],
      "gambol":referrerMap["referrer_url"],
      "aunt":referrerMap["install_version"],
      "iodide":referrerMap["user_agent"],
      "mayapple":"starr",
      "drama":referrerMap["referrer_click_timestamp_seconds"],
      "moderate":referrerMap["install_begin_timestamp_seconds"],
      "ne":referrerMap["referrer_click_timestamp_server_seconds"],
      "cindy":referrerMap["install_begin_timestamp_server_seconds"],
      "emerson":referrerMap["install_first_seconds"],
      "junctor":referrerMap["last_update_seconds"],
    };
    var headerMap = await _createHeaderMap();
    var url = await _createUrl();

  }

  session()async{
    var commonMap = await _createCommonMap();
    commonMap["gorilla"]={};
    var headerMap = await _createHeaderMap();
    var url = await _createUrl();
  }

  ad({
    required AdInfoBean b12allInfoKqmvzr,
    required B16AdSceneJdwo b12allSceneVmqxtr,
    required B16PosidJkwkosw? b12allPosIdPqmvzr,
    required double b12allRevenueNqmvzt,
    required String b12allCurrencyCodeRqmvzt,
    required String b12allAdNetworkKqmvzt,
    required String b12allPrecisionTypeVmqxzr,
})async{
    var commonMap = await _createCommonMap();
    commonMap["jug"]={
      'amtrak': b12allRevenueNqmvzt*1000000,
      'culpable': b12allCurrencyCodeRqmvzt,
      'cushion': b12allAdNetworkKqmvzt,
      'criss': b12allInfoKqmvzr.adPlat ?? '',
      'standard': b12allInfoKqmvzr.adId ?? '',
      'rant': b12allPosIdPqmvzr?.name??"",
      'leisure': b12allSceneVmqxtr.name,
      'lord': b12allPrecisionTypeVmqxzr,
      'ideate': b12allInfoKqmvzr.adType,
    };
    var headerMap = await _createHeaderMap();
    var url = await _createUrl();
  }

  point({
    required B16PointTypeJdwijdiw b12allPointNameKqmvzr,
    Map<String, dynamic>? b12allParamsVmqxtr,
    Map<String, dynamic>? b12allUserGroupVmqxtr,
  })async{
    var commonMap = await _createCommonMap();
    commonMap["rove"]=b12allPointNameKqmvzr.name;
    if(null!=b12allParamsVmqxtr){
      b12allParamsVmqxtr.forEach((key,value){
        commonMap["vaccine~$key"]=value;
      });
    }
    var headerMap = await _createHeaderMap();
    var url = await _createUrl();
  }

  Future<Map<String,dynamic>> _createCommonMap()async{
    return {
      "weco":{
        "baggage": await FlutterTbaInfo.instance.getBundleId(),
        "proper": Platform.isAndroid?"hotelman":"octoroon",
        "germinal":DateTime.now().millisecondsSinceEpoch,
        "tardy": await FlutterTbaInfo.instance.getNetworkType(),
        "vivaldi": await FlutterTbaInfo.instance.getIdfa(),
      },
      "cannibal":{
        "braille":await FlutterTbaInfo.instance.getAppVersion(),
        "fall":await FlutterTbaInfo.instance.getBrand(),
        "awkward":await FlutterTbaInfo.instance.getDeviceModel(),
        "modulus":await FlutterTbaInfo.instance.getOperator(),
        "cornish":await FlutterTbaInfo.instance.getSystemLanguage(),
        "aurelius":await FlutterTbaInfo.instance.getAndroidId(),
      },
      "yew":{
        "secular":await FlutterTbaInfo.instance.getDistinctId(),
        "sorority":await FlutterTbaInfo.instance.getLogId(),
        "moreover":await FlutterTbaInfo.instance.getManufacturer(),
        "gao":await FlutterTbaInfo.instance.getOsVersion(),
        "ogre":await FlutterTbaInfo.instance.getIdfv(),
        "dana":await FlutterTbaInfo.instance.getGaid(),
        "anderson":await FlutterTbaInfo.instance.getOsCountry(),
      },
    };
  }


  Future<Map<String,dynamic>> _createHeaderMap()async{
    return {
      "ogre":await FlutterTbaInfo.instance.getIdfv(),
      "baggage":await FlutterTbaInfo.instance.getBundleId(),
    };
  }

  Future<String> _createUrl()async{
    return "${B16LocalInfoFjeifjioe.tbaUrl}?baggage=${await FlutterTbaInfo.instance.getBundleId()}&fall=${await FlutterTbaInfo.instance.getBrand()}";
  }
}
import 'package:flutter/foundation.dart';

class B16LocalInfoFjeifjioe {
  static final appName = "PDF Editer";
  static final secretKey = "B16secretKeyKhuwi";
  static String adjustToken=kDebugMode?"4qedga65udq8":"";

  static final clockUrl="https://upturn.pdfeditorpaperforge.com/ashmen/emma/irish";


  static const _localReferrerConfigDebug="assets/b16pdf_local_config/b16pdf_local_referrer/b16_referrer_debug.json";
  static const _localReferrerConfigRelease="assets/b16pdf_local_config/b16pdf_local_referrer/b16_referrer_release.json";
  static String localReferrerConfig=kDebugMode?_localReferrerConfigDebug:_localReferrerConfigRelease;

  static const _localAdConfigDebug="assets/b16pdf_local_config/b16pdf_local_ad/b16_ad_debug.json";
  static const _localAdConfigRelease="assets/b16pdf_local_config/b16pdf_local_ad/b16_ad_release.json";
  static String localAdConfig=kDebugMode?_localAdConfigDebug:_localAdConfigRelease;

  static const _tbaUrlDebug="https://test-playpen.pdfeditorpaperforge.com/tipple/chaise/mellon";
  static const _tbaUrlRelease="https://playpen.pdfeditorpaperforge.com/obdurate/impress/hoar";
  static String tbaUrl=kDebugMode?_tbaUrlDebug:_tbaUrlRelease;
}

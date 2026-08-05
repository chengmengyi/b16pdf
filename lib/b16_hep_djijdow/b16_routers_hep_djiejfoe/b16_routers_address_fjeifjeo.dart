import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_delete_file_rqmvza/b16_delete_file_page_kqnvxe.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_choose_language_qxmvza/b16_choose_language_page_kqnvze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_home_qmxvza/b16_home_page_kpnyra.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_images_result_qxnvza/b16_images_result_page_vqntza.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_launcher_feofke/b16_launcher_page_fjeijie.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_notification_page_rqmvza/b16_open_notification_page_kqmxve.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_overlay_permission_page_kxmqva/b16_open_overlay_permission_page_zqtwne.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_preview_pdf_qxmvza/b16_preview_pdf_page_kqnvze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_preview_word_vqntza/b16_preview_word_page_pqmxze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_preview_excel_rqmwza/b16_preview_excel_page_xqnvze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_process_result_vqntza/b16_process_result_page_kqnvze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_process_waiting_hqmwza/b16_process_waiting_page_rqmxze.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_unstall_qxnvza/b16_unstall_page_kqmwze.dart';
import 'package:get/get.dart';

abstract final class B16RoutersAddressFjeifjeo {
  static const String b16LauncherRouteKfmoqa = '/b16_launcher';
  static const String b16OverlayPermissionRouteNqvwza =
      '/b16_open_overlay_permission';
  static const String b16NotificationRouteHqmwza = '/b16_open_notification';
  static const String b16HomeRouteVqmxza = '/b16_home';
  static const String b16DeleteFileRouteKqnvze = '/b16_delete_file';
  static const String b16ChooseLanguageRouteHqmwza = '/b16_choose_language';
  static const String b16PreviewPdfRouteQxmvza = '/b16_preview_pdf';
  static const String b16PreviewWordRouteVqntza = '/b16_preview_word';
  static const String b16PreviewExcelRouteRqmwza = '/b16_preview_excel';
  static const String b16UnstallRouteKqmwze = '/b16_unstall';
  static const String b16ImagesResultRouteVqntza = '/b16_images_result';
  static const String b16ProcessWaitingRouteHqmwza = '/b16_process_waiting';
  static const String b16ProcessResultRoutePqnvze = '/b16_process_result';

  static final List<GetPage<dynamic>> b16PagesRxqtma = [
    GetPage(name: b16LauncherRouteKfmoqa, page: B16LauncherPageFjeijie.new),
    GetPage(
      name: b16OverlayPermissionRouteNqvwza,
      page: B16OpenOverlayPermissionPageZqtwne.new,
    ),
    GetPage(
      name: b16NotificationRouteHqmwza,
      page: B16OpenNotificationPageKqmxve.new,
    ),
    GetPage(name: b16HomeRouteVqmxza, page: B16HomePageKpnyra.new),
    GetPage(name: b16DeleteFileRouteKqnvze, page: B16DeleteFilePageKqnvxe.new),
    GetPage(
      name: b16ChooseLanguageRouteHqmwza,
      page: B16ChooseLanguagePageKqnvze.new,
    ),
    GetPage(name: b16PreviewPdfRouteQxmvza, page: B16PreviewPdfPageKqnvze.new),
    GetPage(
      name: b16PreviewWordRouteVqntza,
      page: B16PreviewWordPagePqmxze.new,
    ),
    GetPage(
      name: b16PreviewExcelRouteRqmwza,
      page: B16PreviewExcelPageXqnvze.new,
    ),
    GetPage(name: b16UnstallRouteKqmwze, page: B16UnstallPageKqmwze.new),
    GetPage(
      name: b16ImagesResultRouteVqntza,
      page: B16ImagesResultPageVqntza.new,
    ),
    GetPage(
      name: b16ProcessWaitingRouteHqmwza,
      page: B16ProcessWaitingPageRqmxze.new,
    ),
    GetPage(
      name: b16ProcessResultRoutePqnvze,
      page: B16ProcessResultPageKqnvze.new,
    ),
  ];
}

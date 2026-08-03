import 'package:b16pdf/b16_pages_fjeifje/b16_launcher_feofke/b16_launcher_page_fjeijie.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_notification_page_rqmvza/b16_open_notification_page_kqmxve.dart';
import 'package:b16pdf/b16_pages_fjeifje/b16_open_overlay_permission_page_kxmqva/b16_open_overlay_permission_page_zqtwne.dart';
import 'package:get/get.dart';

abstract final class B16RoutersAddressFjeifjeo {
  static const String b16LauncherRouteKfmoqa = '/b16_launcher';
  static const String b16OverlayPermissionRouteNqvwza =
      '/b16_open_overlay_permission';
  static const String b16NotificationRouteHqmwza = '/b16_open_notification';

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
  ];
}

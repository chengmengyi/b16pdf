import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_address_fjeifjeo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_language_selected_fjiefjoe.dart';
import 'package:flutter_local_notification_plugins/flutter_local_notification_plugins.dart';
import 'package:permission_handler/permission_handler.dart';

class B16NewUserHepJfiejfo{
  static final B16NewUserHepJfiejfo _b16newUserHepJfiejfo=B16NewUserHepJfiejfo();
  static B16NewUserHepJfiejfo get instance => _b16newUserHepJfiejfo;

  //语言选择页没有点确定----启动app：悬浮窗->语言选择页->通知->首页
  //语言选择页点确定----启动app：悬浮窗->通知->首页
  //这个包测试一下没有悬浮窗的
  // toPageAfterLauncher()async{
  //   var checkOverlayPermission = await FlutterLocalNotificationPlugins.instance.checkOverlayPermission();
  //   if(!checkOverlayPermission){
  //     B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
  //       b16RouteNameYweqpn:
  //       B16RoutersAddressFjeifjeo.b16OverlayPermissionRouteNqvwza,
  //     );
  //     return;
  //   }
  //   toPageAfterOverlay();
  // }

  toPageAfterOverlay(){
    if(B16LanguageSelectedFjiefjoe.b16ReadLanguageVqmxpe().isEmpty){
      B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
        b16RouteNameYweqpn:
        B16RoutersAddressFjeifjeo.b16ChooseLanguageRouteHqmwza,
      );
      return;
    }
    toPageAfterChooseLanguage();
  }

  toPageAfterChooseLanguage()async{
    var permissionStatus = await Permission.notification.status;
    var isGranted = permissionStatus.isGranted || permissionStatus.isLimited;
    if(!isGranted){
      B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
        b16RouteNameYweqpn:
        B16RoutersAddressFjeifjeo.b16NotificationRouteHqmwza,
      );
      return;
    }
    toHome();
  }

  toHome(){
    B16RoutersHepFjeifjoe.b16ReplaceNamedZxplrt<void>(
      b16RouteNameYweqpn:
      B16RoutersAddressFjeifjeo.b16HomeRouteVqmxza,
    );
  }
}
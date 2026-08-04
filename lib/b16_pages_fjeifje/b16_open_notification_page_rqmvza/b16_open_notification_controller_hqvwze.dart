import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:app_settings/app_settings.dart';

class B16OpenNotificationControllerHqvwze extends B16RootControllerFjesak {
  Future<void> clickUpdate() async {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
    B16NewUserHepJfiejfo.instance.toHome();
  }

  void clickLater() {
    B16NewUserHepJfiejfo.instance.toHome();
  }
}

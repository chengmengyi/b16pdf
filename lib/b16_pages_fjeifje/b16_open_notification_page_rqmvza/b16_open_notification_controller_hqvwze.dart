import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:app_settings/app_settings.dart';
import 'package:permission_handler/permission_handler.dart';

class B16OpenNotificationControllerHqvwze extends B16RootControllerFjesak {
  bool _b16WaitingSettingsQxnvza = false;
  bool _b16EnteredBackgroundKqmwze = false;
  bool _b16CheckingPermissionVqntza = false;

  Future<void> clickUpdate() async {
    _b16WaitingSettingsQxnvza = true;
    _b16EnteredBackgroundKqmwze = false;
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  void clickLater() {
    B16NewUserHepJfiejfo.instance.toHome();
  }

  @override
  bool b16RegisterEventfeijif() => true;

  @override
  void b16HandleEventhrifjei(B16EventBeanFhifeode b16EventQzmxva) {
    if (b16EventQzmxva.b16EventCodeFhfemie !=
            B16EventCodeQxmvza.b16AppLifecycleKqmwze ||
        !_b16WaitingSettingsQxnvza) {
      return;
    }

    if (b16EventQzmxva.b16IntValueDjijie == 1) {
      _b16EnteredBackgroundKqmwze = true;
      return;
    }

    if (b16EventQzmxva.b16IntValueDjijie == 0 &&
        _b16EnteredBackgroundKqmwze &&
        !_b16CheckingPermissionVqntza) {
      _b16CheckNotificationPermissionHqmwza();
    }
  }

  Future<void> _b16CheckNotificationPermissionHqmwza() async {
    _b16CheckingPermissionVqntza = true;
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final PermissionStatus b16PermissionStatusPqnvze =
        await Permission.notification.status;
    final bool b16PermissionGrantedKqnvxe =
        b16PermissionStatusPqnvze.isGranted ||
        b16PermissionStatusPqnvze.isLimited;

    _b16WaitingSettingsQxnvza = false;
    _b16EnteredBackgroundKqmwze = false;
    _b16CheckingPermissionVqntza = false;
    if (b16PermissionGrantedKqnvxe) {
      B16NewUserHepJfiejfo.instance.toHome();
    }
  }
}

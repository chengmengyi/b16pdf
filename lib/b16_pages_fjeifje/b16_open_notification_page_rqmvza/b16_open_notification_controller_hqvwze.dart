import 'package:b16pdf/b16_hep_djijdow/b16_new_user_hep_jfiejfo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_bean_fhifeode.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_event_hep_fhiejode/b16_event_code_qxmvza.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class B16OpenNotificationControllerHqvwze extends B16RootControllerFjesak {
  bool _b16WaitingSettingsQxnvza = false;
  bool _b16EnteredBackgroundKqmwze = false;
  bool _b16CheckingPermissionVqntza = false;

  @override
  void onInit() {
    super.onInit();
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.push_guide_view,
      b16ParametersKqmwze: {"show_type":"secondary"},
    );
  }

  Future<void> clickUpdate() async {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.push_guide_click,
      b16ParametersKqmwze: {"state":"turn_on"},
    );
    _b16WaitingSettingsQxnvza = true;
    _b16EnteredBackgroundKqmwze = false;
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  void clickLater() {
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.push_guide_click,
      b16ParametersKqmwze: {"state":"later"},
    );
    _toNextPage();
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
      _toNextPage();
    }
  }

  _toNextPage(){
    var fromHome=B16RoutersHepFjeifjoe.getParams()["fromHome"]??false;
    if(fromHome){
      B16RoutersHepFjeifjoe.b16BackFtynwp();
    }else{
      B16NewUserHepJfiejfo.instance.toHome();
    }
  }
}

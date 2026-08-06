import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_hep_jiwdjow.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_ad_scene_jdwo.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_check_user_jiwojdw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class B16CommentDialogJiwjdiwController extends B16RootControllerFjesak {
  static const String b16StarBuilderIdKqnvze =
      'b16_comment_star_builder_kqnvze';

  int b16StarCountPqnvze = 0;
  bool _b16ClosingDialogQxmvza = false;

  @override
  void onInit() {
    super.onInit();
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.rating_pop_v,
    );
  }

  void b16ClickStarVqmwza(int b16IndexHqmwza) {
    b16StarCountPqnvze = b16IndexHqmwza + 1;
    update(<Object>[b16StarBuilderIdKqnvze]);
  }

  Future<void> b16ClickRateUsKqnvze() async {
    b16StarCountPqnvze = 5;
    update(<Object>[b16StarBuilderIdKqnvze]);
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.rating_pop_c,
    );
    await _b16OpenGooglePlayPqmxza();
  }

  Future<void> b16ClickCloseVqntza() async {
    if (_b16ClosingDialogQxmvza) {
      return;
    }
    _b16ClosingDialogQxmvza = true;
    if (B16UserCheckHepQxnvza.instance.b16IsEligibleUserVqntza
    // && B16FirebaseHepKqmwze.instance.b16CommentOverlayEnabledHqmwza
    ) {
      await B16AdHepJiwdjow.b16AdUtilsInstanceKqmvzr.b16ShowCachedSceneAdPqmvzr(
        b16AdScenePqmvzr: B16AdSceneJdwo.pr_exit,
        b16AdPosIdKqmvzr: B16PosidJkwkosw.pr_exit_app,
      );
    }
    if (Get.isBottomSheetOpen == true) {
      B16RoutersHepFjeifjoe.b16BackFtynwp<bool>(b16ResultNcgkqe: false);
    }
  }

  Future<void> _b16OpenGooglePlayPqmxza() async {
    final String b16PackageNameQxnvza = await FlutterTbaInfo.instance
        .getBundleId();
    final Uri b16MarketUriKqmwze = Uri.parse(
      'market://details?id=$b16PackageNameQxnvza',
    );
    final Uri b16WebUriVqntza = Uri.https(
      'play.google.com',
      '/store/apps/details',
      <String, String>{'id': b16PackageNameQxnvza},
    );
    if (await canLaunchUrl(b16MarketUriKqmwze)) {
      await launchUrl(b16MarketUriKqmwze, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(b16WebUriVqntza, mode: LaunchMode.externalApplication);
    }
    if (Get.isBottomSheetOpen == true) {
      B16RoutersHepFjeifjoe.b16BackFtynwp<bool>(b16ResultNcgkqe: true);
    }
  }
}

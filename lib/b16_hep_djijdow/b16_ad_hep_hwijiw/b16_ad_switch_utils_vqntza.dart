import 'dart:convert';

import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_switch_config_bean_qazxsw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_local_info_fjeifjioe.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_hep_fefjei/b16_local_switch_config_qazxsw.dart';
import 'package:flutter/services.dart';

class B16AdSwitchUtilsVqntza {
  B16AdSwitchUtilsVqntza._();

  static final B16AdSwitchUtilsVqntza instance = B16AdSwitchUtilsVqntza._();

  B16SwitchConfigBeanQazxsw? _b16SwitchConfigBeanKqmwze;

  Future<void> b16InitHqmwza() async {
    try {
      String b16ConfigJsonVqntza =
          B16LocalSwitchConfigQazxsw.b16ReadConfigKqmwze();
      if (b16ConfigJsonVqntza.isEmpty) {
        b16ConfigJsonVqntza = await rootBundle.loadString(
          B16LocalInfoFjeifjioe.b16SwitchConfigPathHqmwza,
        );
      }
      final dynamic b16DecodedConfigPqnvze = jsonDecode(b16ConfigJsonVqntza);
      if (b16DecodedConfigPqnvze is Map<String, dynamic>) {
        _b16SwitchConfigBeanKqmwze =
            B16SwitchConfigBeanQazxsw.b16FromJsonVqntza(b16DecodedConfigPqnvze);
      }
    } catch (_) {
      _b16SwitchConfigBeanKqmwze = null;
    }
  }

  bool b16CanShowAdPqnvze(B16PosidJkwkosw b16PosIdHqmwza) =>
      _b16SwitchConfigBeanKqmwze?.b16CanShowAdHqmwza(b16PosIdHqmwza) ?? true;
}

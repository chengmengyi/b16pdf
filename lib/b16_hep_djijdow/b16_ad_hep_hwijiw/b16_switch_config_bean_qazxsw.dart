import 'package:b16pdf/b16_hep_djijdow/b16_ad_hep_hwijiw/b16_posid_jkwkosw.dart';

class B16SwitchConfigBeanQazxsw {
  B16SwitchConfigBeanQazxsw(this.b16SwitchMapKqmwze);

  factory B16SwitchConfigBeanQazxsw.b16FromJsonVqntza(
    Map<String, dynamic> b16JsonHqmwza,
  ) {
    final Map<B16PosidJkwkosw, bool> b16SwitchMapPqnvze =
        <B16PosidJkwkosw, bool>{};
    for (final B16PosidJkwkosw b16PosIdQxmvza in B16PosidJkwkosw.values) {
      final dynamic b16ValueVmqxtr = b16JsonHqmwza[b16PosIdQxmvza.name];
      if (b16ValueVmqxtr != null) {
        b16SwitchMapPqnvze[b16PosIdQxmvza] = b16ValueVmqxtr != 0;
      }
    }
    return B16SwitchConfigBeanQazxsw(b16SwitchMapPqnvze);
  }

  final Map<B16PosidJkwkosw, bool> b16SwitchMapKqmwze;

  bool b16CanShowAdHqmwza(B16PosidJkwkosw b16PosIdVqntza) =>
      b16SwitchMapKqmwze[b16PosIdVqntza] ?? true;
}

import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_point_type_jdwijdiw.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_tba_hep_jwjowdw/b16_tba_hep_djiwjidw.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';

enum B16SortType {
  dateNew("Date(Newest First)", "b16_sort_newdate_icon"),
  dateOld("Date(Oldest First)", "b16_sort_olddate_icon"),
  nameAZ("Name(A-Z)", "b16_sort_az_icon"),
  nameZA("Name(Z-A)", "b16_sort_za_icon");

  final String b16TextHqmwza;
  final String b16IconKqnvxe;
  const B16SortType(this.b16TextHqmwza, this.b16IconKqnvxe);
}

class B16SortBottomDialogFjiewfjoeController extends B16RootControllerFjesak {
  final B16SortType b16SelectedTypeVqmxza;
  B16SortBottomDialogFjiewfjoeController({required this.b16SelectedTypeVqmxza});

  void clickSort(B16SortType b16TypePqnvze){
    B16TbaHepDjiwjidw.instance.b16UploadPointKqnvxe(
      b16PointTypeQxnvza: B16PointTypeJdwijdiw.file_sort_change,
      b16ParametersKqmwze: {"sort_type":b16TypePqnvze.name},
    );
    B16RoutersHepFjeifjoe.b16BackFtynwp<B16SortType>(
      b16ResultNcgkqe: b16TypePqnvze,
    );
  }
}

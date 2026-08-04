import 'package:b16pdf/b16_hep_djijdow/b16_storage_hep_fjiejfe/b16_storage_name_fjeoifoe.dart';

class B16FileSortStorageMqnvza {
  B16FileSortStorageMqnvza._();
  static String b16ReadSortNameHqmwze(String b16TabNameKqnvxe) =>
      b16GetStorage.read<String>('b16_sort_$b16TabNameKqnvxe') ?? 'dateNew';
  static Future<void> b16WriteSortNamePqmxza({
    required String b16TabNameVqntze,
    required String b16SortNameHqmwza,
  }) => b16GetStorage.write('b16_sort_$b16TabNameVqntze', b16SortNameHqmwza);
}

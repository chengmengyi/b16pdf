import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';

enum B16SortType{
  dateNew("Date(Newest First)","b16_sort_newdate_icon"),
  dateOld("Date(Oldest First)","b16_sort_olddate_icon"),
  nameAZ("Name(A-Z)","b16_sort_az_icon"),
  nameZA("Name(Z-A)","b16_sort_za_icon");
  final String text;
  final String icon;
  const B16SortType(this.text,this.icon);
}

class B16SortBottomDialogFjiewfjoeController extends B16RootControllerFjesak{}
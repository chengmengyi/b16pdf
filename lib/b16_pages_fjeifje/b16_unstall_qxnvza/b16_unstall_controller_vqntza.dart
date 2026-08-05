import 'package:b16pdf/b16_dialog_fjifjie/b16_update_dialog_fowjidwj/b16_update_dialog_fowjidwj.dart';
import 'package:b16pdf/b16_hep_djijdow/b16_routers_hep_djiejfoe/b16_routers_hep_fjeifjoe.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';

class B16UnstallControllerVqntza extends B16RootControllerFjesak {
  TextEditingController textEditingController = TextEditingController();
  final List<String> reasonList = <String>[
    'Hard to use',
    'Frequent ad interference',
    'Poor PDF reading experience',
    'Too many notifications',
    "Editing features don't meet needs",
    'Phone has built-in PDF tools',
    'Other (Please specify)',
  ];

  void clickUninstall() {
    B16RoutersHepFjeifjoe.b16ShowDialogCtmxqe(
      b16ChildWvprka: const B16UpdateDialogFowjidwj(),
    );
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}

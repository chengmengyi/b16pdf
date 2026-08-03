import 'dart:async';

import 'package:flutter/material.dart';

class B16SwitchViewFeifjie extends StatefulWidget {
  const B16SwitchViewFeifjie({super.key});

  @override
  State<B16SwitchViewFeifjie> createState() => _B16SwitchStateKqmvza();
}

class _B16SwitchStateKqmvza extends State<B16SwitchViewFeifjie> {
  static const Duration b16ToggleIntervalVqmxze = Duration(milliseconds: 600);

  Timer? b16ToggleTimerHqmwza;
  bool b16SwitchEnabledPqnvxe = false;

  @override
  void initState() {
    super.initState();
    b16ToggleTimerHqmwza = Timer.periodic(b16ToggleIntervalVqmxze, (
      Timer b16TimerKqmvza,
    ) {
      if (mounted) {
        setState(() {
          b16SwitchEnabledPqnvxe = !b16SwitchEnabledPqnvxe;
        });
      }
    });
  }

  @override
  void dispose() {
    b16ToggleTimerHqmwza?.cancel();
    b16ToggleTimerHqmwza = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: b16SwitchEnabledPqnvxe,
      onChanged: null,
      thumbColor: WidgetStatePropertyAll(
        b16SwitchEnabledPqnvxe ? Colors.white : const Color(0xfff5f5f5),
      ),
      trackColor: WidgetStatePropertyAll(
        b16SwitchEnabledPqnvxe
            ? const Color(0xff0f83f8)
            : const Color(0xffc8cdd2),
      ),
    );
  }
}

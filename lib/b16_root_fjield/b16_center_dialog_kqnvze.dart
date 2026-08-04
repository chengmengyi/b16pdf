import 'package:b16pdf/b16_root_fjield/b16_controller_lease_kmwtza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';

abstract class B16CenterDialogKqnvze<T extends B16RootControllerFjesak>
    extends StatefulWidget {
  const B16CenterDialogKqnvze({super.key});

  String? get b16ControllerTagVqmxra => null;

  bool get b16PermanentControllerPqmwza => false;

  bool get b16AllowBackDismissHqnvxe => false;

  bool get b16DismissKeyboardKqmwza => true;

  EdgeInsets get b16ContentPaddingRqmvza => const EdgeInsets.all(16);

  T b16CreateControllerTqnxre();

  Widget b16BuildDialogVqmwza(
    BuildContext b16ContextHqnvxe,
    T b16ControllerKqmwza,
  );

  @override
  State<B16CenterDialogKqnvze<T>> createState() =>
      _B16CenterDialogStatePqmvza<T>();
}

class _B16CenterDialogStatePqmvza<T extends B16RootControllerFjesak>
    extends State<B16CenterDialogKqnvze<T>> {
  static const Duration b16KeyboardMotionVqmxra = Duration(milliseconds: 180);

  late final B16ControllerLeaseKmwtza<T> b16ControllerLeaseHqmwze;

  @override
  void initState() {
    super.initState();
    b16ControllerLeaseHqmwze = B16ControllerLeaseKmwtza.b16AcquireGtzmvu<T>(
      b16CreateControllerRhpxae: widget.b16CreateControllerTqnxre,
      b16TagYqnfds: widget.b16ControllerTagVqmxra,
      b16PermanentLkezoc: widget.b16PermanentControllerPqmwza,
    );
  }

  @override
  void dispose() {
    b16ControllerLeaseHqmwze.b16ReleaseBqysni();
    super.dispose();
  }

  @override
  Widget build(BuildContext b16ContextKqmwza) {
    final EdgeInsets b16KeyboardInsetsVqnxre = MediaQuery.viewInsetsOf(
      b16ContextKqmwza,
    );
    return PopScope(
      canPop: widget.b16AllowBackDismissHqnvxe,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.b16DismissKeyboardKqmwza
            ? () => FocusManager.instance.primaryFocus?.unfocus()
            : null,
        child: Material(
          type: MaterialType.transparency,
          child: SafeArea(
            child: Center(
              child: widget.b16BuildDialogVqmwza(
                b16ContextKqmwza,
                b16ControllerLeaseHqmwze.b16ControllerNqxrfe,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

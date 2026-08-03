import 'package:b16pdf/b16_root_fjield/b16_controller_lease_kmwtza.dart';
import 'package:b16pdf/b16_root_fjield/b16_root_controller_fjesak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class B16RootPageQazmtr<T extends B16RootControllerFjesak>
    extends StatefulWidget {
  const B16RootPageQazmtr({super.key});

  String? get b16ControllerTagHjrxwa => null;

  bool get b16PermanentControllerZctygu => false;

  bool get b16ResizeToAvoidBottomInsetNwskde => true;

  bool get b16UseSafeBottomVqehcn => true;

  bool get b16AllowRoutePopYmejcu => true;

  Color get b16BackgroundColorLxqvbi => Color(0xffF3F5F7);

  Color get b16NavigationBarColorLxqvbi => Color(0xffF3F5F7);

  SystemUiOverlayStyle get b16SystemUiOverlayStyleGfrtpo =>
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: b16NavigationBarColorLxqvbi,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      );

  T b16CreateControllerAhdwks();

  Widget b16BuildContentRuznxe(
    BuildContext b16ContextCmvqer,
    T b16ControllerTbnyui,
  );

  @override
  State<B16RootPageQazmtr<T>> createState() => _B16RootPageStateVknpse<T>();
}

class _B16RootPageStateVknpse<T extends B16RootControllerFjesak>
    extends State<B16RootPageQazmtr<T>> {
  late final B16ControllerLeaseKmwtza<T> b16ControllerLeaseKjfpso;

  @override
  void initState() {
    super.initState();
    b16ControllerLeaseKjfpso = B16ControllerLeaseKmwtza.b16AcquireGtzmvu<T>(
      b16CreateControllerRhpxae: widget.b16CreateControllerAhdwks,
      b16TagYqnfds: widget.b16ControllerTagHjrxwa,
      b16PermanentLkezoc: widget.b16PermanentControllerZctygu,
    );
  }

  @override
  void dispose() {
    b16ControllerLeaseKjfpso.b16ReleaseBqysni();
    super.dispose();
  }

  @override
  Widget build(BuildContext b16ContextQewrty) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: widget.b16SystemUiOverlayStyleGfrtpo,
      child: PopScope(
        canPop: widget.b16AllowRoutePopYmejcu,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: widget.b16BackgroundColorLxqvbi,
            resizeToAvoidBottomInset: widget.b16ResizeToAvoidBottomInsetNwskde,
            body: SafeArea(
              top: false,
              bottom: widget.b16UseSafeBottomVqehcn,
              child: widget.b16BuildContentRuznxe(
                b16ContextQewrty,
                b16ControllerLeaseKjfpso.b16ControllerNqxrfe,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

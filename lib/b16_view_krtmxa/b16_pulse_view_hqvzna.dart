import 'package:flutter/material.dart';

class B16PulseViewHqvzna extends StatefulWidget {
  const B16PulseViewHqvzna({
    super.key,
    required this.b16ChildPxnvta,
    this.b16LowerScaleGqmwre = 0.96,
    this.b16UpperScaleZkfydu = 1,
    this.b16CycleDurationVctjpo = const Duration(milliseconds: 400),
    this.b16CurveLqhebx = Curves.easeInOut,
  }) : assert(b16LowerScaleGqmwre > 0),
       assert(b16LowerScaleGqmwre <= b16UpperScaleZkfydu),
       assert(b16CycleDurationVctjpo > Duration.zero);

  final Widget b16ChildPxnvta;
  final double b16LowerScaleGqmwre;
  final double b16UpperScaleZkfydu;
  final Duration b16CycleDurationVctjpo;
  final Curve b16CurveLqhebx;

  @override
  State<B16PulseViewHqvzna> createState() => _B16PulseViewStateRmwqcs();
}

class _B16PulseViewStateRmwqcs extends State<B16PulseViewHqvzna>
    with SingleTickerProviderStateMixin {
  late final AnimationController b16MotionControllerDpxqva;
  late Animation<double> b16ScaleMotionFjwnke;
  bool b16AnimationsDisabledTyqlzr = false;

  @override
  void initState() {
    super.initState();
    b16MotionControllerDpxqva = AnimationController(
      vsync: this,
      duration: widget.b16CycleDurationVctjpo,
    );
    b16ConfigureMotionSnvxku();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool b16DisableMotionKwmxpa = MediaQuery.disableAnimationsOf(context);
    if (b16DisableMotionKwmxpa == b16AnimationsDisabledTyqlzr) {
      return;
    }
    b16AnimationsDisabledTyqlzr = b16DisableMotionKwmxpa;
    b16SyncPlaybackHqczve();
  }

  @override
  void didUpdateWidget(covariant B16PulseViewHqvzna oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.b16CycleDurationVctjpo != widget.b16CycleDurationVctjpo) {
      b16MotionControllerDpxqva.duration = widget.b16CycleDurationVctjpo;
    }
    if (oldWidget.b16LowerScaleGqmwre != widget.b16LowerScaleGqmwre ||
        oldWidget.b16UpperScaleZkfydu != widget.b16UpperScaleZkfydu ||
        oldWidget.b16CurveLqhebx != widget.b16CurveLqhebx) {
      b16ConfigureMotionSnvxku();
    }
  }

  void b16ConfigureMotionSnvxku() {
    b16ScaleMotionFjwnke =
        Tween<double>(
          begin: widget.b16LowerScaleGqmwre,
          end: widget.b16UpperScaleZkfydu,
        ).animate(
          CurvedAnimation(
            parent: b16MotionControllerDpxqva,
            curve: widget.b16CurveLqhebx,
          ),
        );
    b16SyncPlaybackHqczve();
  }

  void b16SyncPlaybackHqczve() {
    if (b16AnimationsDisabledTyqlzr) {
      b16MotionControllerDpxqva.stop();
      b16MotionControllerDpxqva.value = 1;
    } else if (!b16MotionControllerDpxqva.isAnimating) {
      b16MotionControllerDpxqva.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    b16MotionControllerDpxqva.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: b16ScaleMotionFjwnke,
      child: widget.b16ChildPxnvta,
    );
  }
}

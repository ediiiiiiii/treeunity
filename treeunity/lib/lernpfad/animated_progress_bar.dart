import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({super.key, required this.value});

  final double value;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  SMIInput<double>? progressControl;

  late AnimationController controller;
  late Animation<double> animation;

  StateMachineController? riveController;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animateProgressBar(0, widget.value);
  }

  void _onRiveInit(Artboard artboard) {
    riveController =
        StateMachineController.fromArtboard(artboard, 'Loading Bar');
    artboard.addController(riveController!);
    progressControl =
        riveController?.findInput<double>("Progress") as SMINumber;
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animateProgressBar(oldWidget.value, widget.value);
  }

  void _animateProgressBar(double oldValue, double newValue) {
    if (oldValue != newValue) {
      controller.reset();
      progressControl?.value = oldValue;
      animation = Tween<double>(begin: oldValue, end: newValue)
          .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
      controller.addListener(() {
        progressControl?.value = animation.value;
      });
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: RiveAnimation.asset(
        "assets/loading_bar.riv",
        artboard: "Loading Bar",
        onInit: _onRiveInit,
        fit: BoxFit.fill,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}

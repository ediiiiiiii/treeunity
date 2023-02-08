import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class AnimatedRespondButton extends StatefulWidget {
  const AnimatedRespondButton(
      {super.key, this.child, required this.onTap, required this.value});
  final Widget? child;
  final Function onTap;
  final List<bool> value;

  @override
  State<AnimatedRespondButton> createState() => _AnimatedRespondButtonState();
}

class _AnimatedRespondButtonState extends State<AnimatedRespondButton> {
  StateMachineController? riveController;

  SMIInput<bool>? selected;
  SMIInput<bool>? correct;
  SMIInput<bool>? incorrect;

  void _onRiveInit(Artboard artboard) {
    riveController = StateMachineController.fromArtboard(artboard, "Button");
    artboard.addController(riveController!);

    selected = riveController?.findInput<bool>("selected") as SMIBool;
    correct = riveController?.findInput<bool>("correct") as SMIBool;
    incorrect = riveController?.findInput<bool>("incorrect") as SMIBool;
    selected?.value = widget.value[0];
    correct?.value = widget.value[1];
    incorrect?.value = widget.value[2];
  }

  @override
  void didUpdateWidget(covariant AnimatedRespondButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    selected?.value = widget.value[0];
    correct?.value = widget.value[1];
    incorrect?.value = widget.value[2];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/button.riv",
              artboard: "Button",
              onInit: _onRiveInit,
              stateMachines: const ["Button"],
            ),
            widget.child ?? Container()
          ],
        ),
      ),
      onTapDown: (TapDownDetails t) {
        widget.onTap(
          selected!.value,
          correct!.value,
          incorrect!.value,
        );
      },
    );
  }
}

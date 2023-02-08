import 'package:flutter/widgets.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation(
      {super.key,
      required this.oldChild,
      required this.newChild,
      required this.onFinished,
      this.duration = const Duration(seconds: 1)});
  final Widget oldChild;
  final Widget newChild;
  final Function onFinished;
  final Duration duration;
  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addListener(() => setState(() {}));
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onFinished(widget.newChild);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
            offset: Offset(
                -_animation.value * MediaQuery.of(context).size.width, 0),
            child: widget.oldChild),
        Transform.translate(
          offset: Offset(
              MediaQuery.of(context).size.width * (1.0 - _animation.value), 0),
          child: widget.newChild,
        )
      ],
    );
  }
}

class SlideAnimation2 extends StatefulWidget {
  SlideAnimation2(
      {super.key,
      required this.child,
      required this.onFinished,
      this.duration = const Duration(seconds: 1)});
  final Widget child;
  final Function onFinished;
  final Duration duration;
  @override
  State<SlideAnimation2> createState() => _SlideAnimation2State();
}

class _SlideAnimation2State extends State<SlideAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationOld;
  late Animation<Offset> _animationNew;

  Widget? oldChild;
  late Widget body;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animationOld = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _animationNew = Tween<Offset>(
      begin: const Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addListener(() => setState(() {}));
    _animationOld.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onFinished();
        _showBody();
        setState(() {});
      }
    });
    _showBody();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SlideAnimation2 oldWidget) {
    super.didUpdateWidget(oldWidget);

    _controller.reset();
    _animationOld =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0))
            .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _animationNew = Tween<Offset>(begin: const Offset(1.0, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.forward();
    oldChild = oldWidget.child;
    _showAnimation();
  }

  _showBody() {
    body = widget.child;
    setState(() {});
  }

  _showAnimation() {
    if (oldChild != null) {
      body = Stack(
        children: [
          SlideTransition(
              position: _animationOld,
              child: Stack(
                  children: [oldChild!, const Center(child: Text("OLD"))])),
          SlideTransition(
              position: _animationNew,
              child: Stack(
                  children: [widget.child, const Center(child: Text("NEW"))]))
        ],
      );
    } else {
      _showBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return body;
  }
}

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final animationtween = MultiTween() // <== ISSUE IS HERE
      ..add("opacity", Tween(begin: 0.0, end: 1.0))
      ..add("translateY", Tween(begin: -30.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues>(
      // <== ISSUE IS ALSO HERE
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: animationtween.duration,
      tween: animationtween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get("opacity"),
        child: Transform.translate(
            offset: Offset(0, animation.get("translateY")), child: child),
      ),
    );
  }
}

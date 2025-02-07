import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
    animation = TweenSequence<int>(
      [
        TweenSequenceItem(tween: ConstantTween(0), weight: 1),
        TweenSequenceItem(tween: ConstantTween(1), weight: 1),
        TweenSequenceItem(tween: ConstantTween(2), weight: 1),
      ],
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _Circle(index == animation.value),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle(this.active);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? const Color(0xffFBFF01)
            : const Color(0xffFBFF01).withOpacity(0.2),
      ),
    );
  }
}

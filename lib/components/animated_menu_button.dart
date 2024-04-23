import 'package:flutter/material.dart';

class AnimatedMenuButton extends StatefulWidget {
  const AnimatedMenuButton({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedMenuButtonState();
}

class _AnimatedMenuButtonState extends State<AnimatedMenuButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150))
    ..addListener(() {
      setState(() {});
    });

  late final Animation<double> animation = Tween<double>(begin: 0.0, end: 0.6).animate(controller);

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        color: Colors.deepOrange,
        icon: AnimatedIcons.menu_home,
        progress: animation,
      ),
      onPressed: () {
        controller.forward()
            .then((value) => Scaffold.of(context).openDrawer())
            .then((value) => controller.reverse());
      },
    );
  }
}

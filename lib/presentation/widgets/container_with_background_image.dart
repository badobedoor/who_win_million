import 'package:flutter/material.dart';

class ContainerWithBackgroundImage extends StatelessWidget {
  final Widget child;
  ContainerWithBackgroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
        ),
        child: child);
  }
}

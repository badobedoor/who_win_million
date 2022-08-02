import 'package:flutter/material.dart';

class ContainerWithCenterLogoBackgroundImage extends StatelessWidget {
  ContainerWithCenterLogoBackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/splachScreen.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}

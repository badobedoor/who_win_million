import 'package:flutter/material.dart';
import 'package:who_win_million/constants/my_colors.dart';

class BlackScreenWithOpacity extends StatelessWidget {
  const BlackScreenWithOpacity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: MyColors.black.withOpacity(0.6),
    );
  }
}

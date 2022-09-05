/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class PlayLogoAnimation extends StatefulWidget {
  const PlayLogoAnimation({Key? key}) : super(key: key);

  @override
  _PlayLogoAnimationState createState() => _PlayLogoAnimationState();
}

class _PlayLogoAnimationState extends State<PlayLogoAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  // bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    // _controller = OneShotAnimation(
    //   'bounce',
    //   autoplay: true,
    //   onStop: () => setState(() => _isPlaying = false),
    //   onStart: () => setState(() => _isPlaying = true),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333.w,
      height: 331.h,
      alignment: Alignment.center,
      child: RiveAnimation.asset(
        'assets/images/milon.riv',
        fit: BoxFit.fill,
        // animations: const ['idle', 'curves'],
        // controllers: [_controller],
      ),
    );
  }
}

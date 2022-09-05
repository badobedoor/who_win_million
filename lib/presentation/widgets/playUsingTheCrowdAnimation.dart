/// Demonstrates playing a one-shot animation on demand
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:who_win_million/presentation/widgets/usingTheCrowd.dart';

class PlayUsingTheCrowdAnimation extends StatefulWidget {
  const PlayUsingTheCrowdAnimation({Key? key}) : super(key: key);

  @override
  _PlayUsingTheCrowdAnimationState createState() =>
      _PlayUsingTheCrowdAnimationState();
}

class _PlayUsingTheCrowdAnimationState
    extends State<PlayUsingTheCrowdAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  // bool _isPlaying = true;
  Future animationEnd(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    return UsingTheCrowd();
  }

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
    return FutureBuilder(
      future: animationEnd(context),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else {
          return Center(
            child: Container(
              width: 340.w,
              height: 234.h,
              alignment: Alignment.center,
              child: RiveAnimation.asset(
                'assets/images/usingTheCrowd.riv',
                fit: BoxFit.fill,
                // animations: const ['idle', 'curves'],
                // controllers: [_controller],
              ),
            ),
          );
        }
      },
    );
  }
}

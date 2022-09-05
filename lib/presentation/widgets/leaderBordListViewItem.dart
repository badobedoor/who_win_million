// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:who_win_million/constants/my_colors.dart';

import '../../data/models/getLeaderboard.dart';
import 'containerWithLinearGradient.dart';

class ListViewItem extends StatelessWidget {
  final Color? color;
  LeaderboardData? leaderboard;
  final int? playerRankingNumber;
  String? playerName;
  int? playerScore;
  ListViewItem(
      {Key? key,
      this.color,
      this.playerName,
      this.playerScore,
      this.leaderboard,
      required this.playerRankingNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _getPlayerName() {
      if (leaderboard != null) {
        return leaderboard!.playerName!;
      } else if (playerName != null) {
        return playerName!;
      } else {
        return 'user';
      }
    }

    int _getPlayerScore() {
      if (leaderboard != null) {
        return leaderboard!.playerScore!;
      } else if (playerScore != null) {
        return playerScore!;
      } else {
        return 0;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 10.h),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 25.w,
            child: Text(
              '.$playerRankingNumber ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: color ?? MyColors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 130.w,
            child: Text(
              _getPlayerName(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          LinearContainer(
            width: 165,
            height: 35,
            // borderRadius: 6,
            child: Text(
              _getPlayerScore().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

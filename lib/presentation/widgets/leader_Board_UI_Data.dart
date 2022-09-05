import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/leaderbord_cubit.dart';
import '../../data/models/getLeaderboard.dart';
import 'leaderBordListViewItem.dart';

class LeaderBoardUIData extends StatelessWidget {
  const LeaderBoardUIData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int playerRankingNumber(
        {required List<LeaderboardData> leaderBoard,
        required LeaderboardData value}) {
      return (leaderBoard.indexWhere((element) => element.id == value.id) + 1);
    }

    return BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) {
      if (state is LeaderbordLoding)
        return Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: CircularProgressIndicator(),
        );
      if (state is LeaderboardLoaded) {
        final leaderBoard = state.leaderboardData;
        return SizedBox(
          width: 386.w,
          height: 195.h,
          child: SingleChildScrollView(
            child: Column(
              children: leaderBoard
                  .map(
                    (value) => ListViewItem(
                      leaderboard: value,
                      playerRankingNumber: playerRankingNumber(
                          leaderBoard: leaderBoard, value: value),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      }
      return Padding(
        padding: EdgeInsets.only(top: 100.h),
        child: CircularProgressIndicator(),
      );
      // final leaderBoard =
      //     (state as LeaderboardLoaded).leaderboardData;
    });
  }
}

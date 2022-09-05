import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class LeaderbordWebServices {
  late Dio dio;

  LeaderbordWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 50 * 1000, // 60 seconds,
      receiveTimeout: 50 * 1000,
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getLeaderboard() async {
    try {
      final response = await dio.get('getLeaderboard');

      return response.data;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> getPlayerScoreByID({required int id}) async {
    try {
      final response = await dio.get('getPlayerScore/$id');
      return response.data;
    } catch (e) {
      return {};
    }
  }
}

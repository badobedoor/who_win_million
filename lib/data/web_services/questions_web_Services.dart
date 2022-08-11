import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class QuestionsWebServices {
  late Dio dio;

  QuestionsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getRandomQuestion() async {
    try {
      final response = await dio.get('getRandomQuestion');
      return response.data;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, dynamic>> increaseScorebyID({
    required int id,
    required int playerScore,
  }) async {
    try {
      var formData = FormData.fromMap({
        'player_score': playerScore,
      });
      final response = await dio.post('increaseScore/$id', data: formData);
      return response.data;
    } catch (e) {
      return {};
    }
  }
}

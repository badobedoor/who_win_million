// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:who_win_million/data/models/loginPlayerAccount_by_ID.dart';
import '../../constants/strings.dart';
import '../models/newPlayer.dart';

class RegistrationWebServices {
  static final _googleSignIn = GoogleSignIn();

  late Dio dio;

  RegistrationWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  static Future<GoogleSignInAccount?> googlelogin() => _googleSignIn.signIn();
  static Future googlelogout() => _googleSignIn.disconnect();

  //get
  Future createNewPlayer() async {
    try {
      final response = await dio.get('createNewPlayer');
      return response.data;
    } catch (e) {
      return {};
    }
  }

  //post
  Future<Map<String, dynamic>> createNewPlayerWithAccount(
      Map<String, String> mapData) async {
    try {
      final formData = FormData.fromMap(mapData);
      final response =
          await dio.post('createNewPlayerWithAccount', data: formData);
      var t = response.data;
      return response.data;
    } catch (e) {
      //هنا فى خطأ دلوات انا لو  كنت سجلت دخول قبل كده وبعد كده مسحت العبه مثلا وبعدين نزلتها وسجلت دخول تانى بنفس اميلى هيدينى 404  ودا غلط

      // if(e.toString()== 'DioError [DioErrorType.response]: Http status error [404]'){
      //   return {'mas':'asdas'};
      // }

      return {};
    }
  }

  //get
  Future getPlayerNameByID({required int id}) async {
    try {
      final response = await dio.get('getPlayerName/$id');
      return response.data;
    } catch (e) {
      return {};
    }
  }

  //post
  Future<Map<String, dynamic>> updatePlayerName(
      {required var id, required String playerName}) async {
    try {
      var formData = FormData.fromMap({
        'player_name': playerName,
      });
      id = id.toString();
      Response response =
          await dio.post('updatePlayerName/' + id, data: formData);
      return response.data;
    } catch (e) {
      return {};
    }
  }

  //get
  Future<List<dynamic>> isRegistered({required var id}) async {
    try {
      id = id.toString();
      Response response = await dio.get('IsRegistered/' + id);
      return response.data;
    } catch (e) {
      return [];
    }
  }

//post
  Future<Map<String, dynamic>> loginPlayerAccountByID(
      {required var id,
      required String name,
      required String email,
      required String emailType}) async {
    try {
      var formData = FormData.fromMap({
        "player_name": name,
        'player_email': email,
        'email_type': emailType,
      });

      Response response =
          await dio.post("createPlayerAccount/$id", data: formData);
      return response.data;
    } catch (e) {
      return {};
    }
  }
}

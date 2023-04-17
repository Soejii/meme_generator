import 'package:dio/dio.dart';
import 'package:meme_generator/model/MemeModel.dart';

import 'config_api.dart';

class ApiData {
  static Dio dio = Dio();
  static Response? response;

  static Future<List<MemeModel>?> getAllMemes() async {
    try {
      response = await ConfigApi.apiGetPublic(
        url: "https://api.imgflip.com/get_memes",
      );
      if (response!.statusCode == 200) {
        print('--- Get Memes ---');
        return (response!.data['data']['memes'] as List)
            .map((e) => MemeModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

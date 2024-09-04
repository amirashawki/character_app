// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:project/data/models/Character_model.dart';

class CharactersServices {
  Dio dio = Dio();
  CharactersServices() {
    BaseOptions options = BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 5 * 1000),
        receiveTimeout: Duration(seconds: 5 * 1000));
    dio.options;
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    try {
      Response response =
          await dio.get('https://rickandmortyapi.com/api/character');
      List<dynamic> characters = response.data['results'];
      return characters
          .map((character) =>
              CharacterModel.fromJson(character as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}

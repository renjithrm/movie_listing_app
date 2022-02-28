import 'package:http/http.dart' as http;
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/const.dart';

class ApiService {
  static Future<List<MovieModel>> getApiService() async {
    try {
      var client = http.Client();

      var responce = await client.get(Uri.parse(api));
      if (responce.statusCode == 200) {
        var jsonString = responce.body;
        var movieData = movieModelFromJson(jsonString);

        return movieData;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
      // return movieData;
    }
  }
}

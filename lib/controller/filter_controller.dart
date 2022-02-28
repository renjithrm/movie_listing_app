import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/api_service.dart';

class FilterController {
  static Future<List<MovieModel>> filtet(Enum genres) async {
    List<MovieModel> drama = [];
    var allMovies = await ApiService.getApiService();
    for (var item in allMovies) {
      if (item.genres!.contains(genres)) {
        drama.add(item);
      }
    }
    return drama;
  }
}

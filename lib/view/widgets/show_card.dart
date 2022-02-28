import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/view/details_screen.dart';

class ShowCard extends StatelessWidget {
  List<MovieModel> movieData;
  int index;
  // String image;
  ShowCard({Key? key, required this.index, required this.movieData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = movieData[index].image!.medium.toString();

    return GestureDetector(
      onTap: () async => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              DetailsScreen(movieData: movieData, index: index))),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  List<MovieModel> movieData;
  int index;
  DetailsScreen({Key? key, required this.movieData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff131a22),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 270,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      movieData[index].image!.original.toString(),
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieData[index].name.toString(),
                style: GoogleFonts.rowdies(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieData[index].summary.toString(),
                style: GoogleFonts.rowdies(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Rating :${movieData[index].rating!.average}",
                style: GoogleFonts.rowdies(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieData[index].language.toString().toLowerCase(),
                style: GoogleFonts.rowdies(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieData[index].genres![1].toString().toLowerCase(),
                style: GoogleFonts.rowdies(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/view/widgets/show_card.dart';

import '../model/movie_model.dart';

const String api = "http://api.tvmaze.com/shows";

Widget buildBanner(Future<List<MovieModel>> movesData, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.rowdies(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      Expanded(
        child: FutureBuilder<List<MovieModel>>(
            future: movesData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MovieModel>? data = snapshot.data;

                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // var image = data![index].image!.medium.toString();
                      return ShowCard(index: index, movieData: data!);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: data!.length);
                // } else if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Center(
                //     child: CircularProgressIndicator(),
                //   );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return Container();
              }
            }),
      ),
    ],
  );
}

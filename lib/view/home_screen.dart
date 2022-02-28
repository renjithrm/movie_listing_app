import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/controller/filter_controller.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/service/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<MovieModel>> _drama;
  late Future<List<MovieModel>> _action;
  late Future<List<MovieModel>> _scienceFiction;
  late Future<List<MovieModel>> _triller;
  late Future<List<MovieModel>> _anime;
  late Future<List<MovieModel>> _comedy;
  @override
  void initState() {
    _action = FilterController.filtet(Genre.ACTION);
    _drama = FilterController.filtet(Genre.DRAMA);
    _scienceFiction = FilterController.filtet(Genre.SCIENCE_FICTION);
    _triller = FilterController.filtet(Genre.THRILLER);
    _anime = FilterController.filtet(Genre.ANIME);
    _comedy = FilterController.filtet(Genre.COMEDY);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Movie App",
            style: GoogleFonts.rowdies(),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff131a22),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                // await FilterController.filtet(Genre.ACTION);
              },
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff131a22),
          padding: const EdgeInsets.all(15),
          child: FutureBuilder<List<MovieModel>>(
              future: _action,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250,
                              child: buildBanner(_action, "Action"),
                            ),
                            SizedBox(
                              height: 250,
                              child: buildBanner(_anime, "Anime"),
                            ),
                            SizedBox(
                              height: 250,
                              child: buildBanner(
                                  _scienceFiction, "Science Fiction"),
                            ),
                            SizedBox(
                              height: 250,
                              child: buildBanner(_comedy, "Comedy"),
                            ),
                            SizedBox(
                              height: 250,
                              child: buildBanner(_triller, "Triller"),
                            ),
                            SizedBox(
                              height: 250,
                              child: buildBanner(_drama, "Drama"),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: const Center(child: CircularProgressIndicator()),
                      );
              }),
        ));
  }
}

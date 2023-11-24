import 'package:flutter/material.dart';
import 'package:quad_assignment/constant/movie_card.dart';
import 'package:quad_assignment/models/movie.dart';
import 'package:quad_assignment/screens/movie_details.dart';
import 'package:quad_assignment/services/movieservices.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final MovieServices movieServices = MovieServices();
  List<Movie>? movies;

  void fetchMovies() async {
    movies = await movieServices.fetchMovies(context);
    setState(() {});
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: movies == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: movies!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetails(movie: movies![index]),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 250,
                      width: double.infinity,
                      child: MovieCard(movie: movies![index]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

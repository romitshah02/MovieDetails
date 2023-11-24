// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quad_assignment/constant/movie_card.dart';
import 'package:quad_assignment/models/movie.dart';
import 'package:quad_assignment/screens/movie_details.dart';
import 'package:quad_assignment/services/movieservices.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    this.query,
  }) : super(key: key);
  final String? query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final MovieServices movieServices = MovieServices();
  List<Movie>? movies;

  void searchMovies(String query) async {
    movies = await movieServices.fetchcustomMovies(context, query);
    setState(() {});
  }

  @override
  void initState() {
    if (widget.query != null) {
      searchMovies(widget.query!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            height: 32,
            margin: const EdgeInsets.only(left: 15),
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                onFieldSubmitted: searchMovies,
                decoration: const InputDecoration(
                  prefixIcon: InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(color: Colors.black38, width: 1),
                  ),
                  hintText: "Search Movies",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: movies == null
          ? const Center(
              child: Text(
                'Search Something....',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        height: 250,
                        width: 50,
                        child: MovieCard(movie: movies![index])),
                  ),
                );
              },
            ),
    );
  }
}

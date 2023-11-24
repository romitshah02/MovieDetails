// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quad_assignment/constant/error_handler.dart';
import 'package:quad_assignment/models/movie.dart';

class MovieServices {
  List<Movie> movies = [];
  Future<List<Movie>> fetchMovies(BuildContext context) async {
    try {
      http.Response res = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            movies.add(
                Movie.fromJson(jsonEncode(jsonDecode(res.body)[i]['show'])));
          }
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return movies;
  }

  Future<List<Movie>> fetchcustomMovies(
      BuildContext context, String query) async {
    try {
      http.Response res = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            movies.add(
                Movie.fromJson(jsonEncode(jsonDecode(res.body)[i]['show'])));
          }
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return movies;
  }
}

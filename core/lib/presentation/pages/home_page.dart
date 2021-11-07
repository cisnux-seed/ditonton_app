import 'package:core/presentation/widgets/custom_drawer.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'movies/home_movie.dart';
import 'tv/home_tv.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      content: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SEARCH_ROUTE);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeMovie(),
                HomeTv(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/description.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  const UpcomingMovies({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Movies",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: upcoming.length != null ? upcoming.length : 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //add func
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: upcoming[index]['title'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              upcoming[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              upcoming[index]['poster_path'],
                          description: upcoming[index]['overview'],
                          launchOn: upcoming[index]['release_date'],
                          vote: upcoming[index]['vote_average'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Text(
                            upcoming[index]['title'] != null
                                ? upcoming[index]['title']
                                : "Loading",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

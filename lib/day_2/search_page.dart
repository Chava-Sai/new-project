import 'package:day_app/day_2/movie_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  List<Map<String, dynamic>> filteredMovies = [];

  final List<Map<String, dynamic>> movies = [
    // Same movie list as in HomePage
    {
      "title": "Avengers",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
      "description":
          "Earth's mightiest heroes must come together to stop a global threat.",
      "releaseDate": "2012-04-25",
      "rating": "8.0",
      "genre": "Action, Adventure, Sci-Fi",
      "cast": [
        {
          "name": "Robert Downey Jr.",
          "image":
              "https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_.jpg",
        },
        {
          "name": "Chris Evans",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_.jpg",
        },
        {
          "name": "Scarlett Johansson",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTM3OTUwMDYwNl5BMl5BanBnXkFtZTcwNTUyNzc3Nw@@._V1_.jpg",
        },
        {
          "name": "Chris Hemsworth",
          "image":
              "https://m.media-amazon.com/images/M/MV5BOTU2MTI0NTIyNV5BMl5BanBnXkFtZTcwMTA4Nzc3OA@@._V1_.jpg",
        },
      ],
    },
    {
      "title": "Inception",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg",
      "description":
          "A thief who steals corporate secrets through dreams must plant an idea.",
      "releaseDate": "2010-07-16",
      "rating": "8.8",
      "genre": "Action, Adventure, Sci-Fi",
      "cast": [
        {
          "name": "Leonardo DiCaprio",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMjI0MTg3MzI0M15BMl5BanBnXkFtZTcwMzQyODU2Mw@@._V1_.jpg",
        },
        {
          "name": "Joseph Gordon-Levitt",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTY3NTk0NDI3Ml5BMl5BanBnXkFtZTgwNDA3NjY0MjE@._V1_.jpg",
        },
        {
          "name": "Ellen Page",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTQ3ODEyNjA4Nl5BMl5BanBnXkFtZTgwMTE4ODMyMjE@._V1_.jpg",
        },
        {
          "name": "Tom Hardy",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTQ3ODEyNjA4Nl5BMl5BanBnXkFtZTgwMTE4ODMyMjE@._V1_.jpg",
        },
      ],
    },
    {
      "title": "The Dark Knight",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg",
      "description":
          "Batman faces the Joker, a criminal mastermind who brings chaos to Gotham.",
      "releaseDate": "2008-07-18",
      "rating": "9.0",
      "genre": "Action, Crime, Drama",
      "cast": [
        {
          "name": "Christian Bale",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
        },
        {
          "name": "Heath Ledger",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_.jpg",
        },
        {
          "name": "Aaron Eckhart",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_.jpg",
        },
        {
          "name": "Gary Oldman",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTI2NTY0NzA4MF5BMl5BanBnXkFtZTYwMjE1MDE0._V1_.jpg",
        },
      ],
    },
    {
      "title": "Interstellar",
      "poster":
          "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
      "description":
          "A team travels through a wormhole to ensure humanity's survival.",
      "releaseDate": "2014-11-07",
      "rating": "8.6",
      "genre": "Adventure, Drama, Sci-Fi",
      "cast": [
        {
          "name": "Matthew McConaughey",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_.jpg",
        },
        {
          "name": "Anne Hathaway",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTRhNzQ3NGMtZmQ1Mi00ZTViLTk3OTgtOTk0YzE2YTgwMmFjXkEyXkFqcGdeQXVyNzg5MzIyOA@@._V1_.jpg",
        },
        {
          "name": "Jessica Chastain",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTU1MDM5NjczOF5BMl5BanBnXkFtZTcwOTY2MDE4OA@@._V1_.jpg",
        },
        {
          "name": "Michael Caine",
          "image":
              "https://m.media-amazon.com/images/M/MV5BMTg0MDc3ODUwOV5BMl5BanBnXkFtZTcwMTk2NjY4Nw@@._V1_.jpg",
        },
      ],
    },
    // Add other movie objects similarly...
  ];

  void updateSearch(String input) {
    setState(() {
      query = input;
      filteredMovies = movies
          .where(
            (movie) => movie['title'].toString().toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Movies"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: "Search by movie title...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredMovies.isEmpty
                  ? Center(
                      child: Text(
                        query.isEmpty
                            ? 'Start typing to search...'
                            : 'No movies found!',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 500,
                                ),
                                pageBuilder: (context, animation, _) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: MovieDetailScreen(
                                      title: movie['title'],
                                      poster: movie['poster'],
                                      description: movie['description'],
                                      releaseDate: movie['releaseDate'],
                                      rating: movie['rating'],
                                      genre: movie['genre'],
                                      cast: movie['cast'],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.grey[850]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    movie['poster'],
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie['title'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          movie['description'],
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              movie['rating'],
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
      ),
    );
  }
}

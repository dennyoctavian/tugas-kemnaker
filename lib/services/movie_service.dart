part of 'services.dart';

class MovieService {
  final String _apiKey = dotenv.env['API_READ_ACCESS_TOKEN'] ?? '';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http
        .get(Uri.parse('$url/movie/popular?language=en-US&page=1'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<MovieDetail> fetchMovieDetail(int movieId) async {
    final response = await http.get(Uri.parse('$url/movie/$movieId'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return MovieDetail.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}

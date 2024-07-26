part of 'provider.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movie = [];
  Status _status = Status.loading;
  List<Movie> get movie => _movie;
  Status get status => _status;

  Future<void> fetchMovie() async {
    try {
      _status = Status.loading;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      _movie = await MovieService().fetchPopularMovies();
      _status = Status.success;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    } catch (e) {
      _status = Status.error;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
    }
  }
}

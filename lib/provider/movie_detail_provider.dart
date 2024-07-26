part of 'provider.dart';

class MovieDetailProvider extends ChangeNotifier {
  MovieDetail _movie = MovieDetail();
  Status _status = Status.loading;
  MovieDetail get movie => _movie;
  Status get status => _status;

  Future<void> fetchMovieDetail(int id) async {
    try {
      _status = Status.loading;
      Future.delayed(Duration.zero, () {
        notifyListeners();
      });
      _movie = await MovieService().fetchMovieDetail(id);
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

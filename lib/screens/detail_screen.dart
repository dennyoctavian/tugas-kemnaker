part of 'screens.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    var provider = context.read<MovieDetailProvider>();
    provider.fetchMovieDetail(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.movie.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              provider.movie.title ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text('Release Date: ${provider.movie.releaseDate ?? ''}'),
            const SizedBox(height: 8.0),
            const Text('Overview:'),
            const SizedBox(height: 8.0),
            Text(provider.movie.overview ?? ''),
          ],
        ),
      ),
    );
  }
}

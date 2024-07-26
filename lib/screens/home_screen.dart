part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieProvider provider;
  @override
  void initState() {
    super.initState();
    provider = context.read<MovieProvider>();
    provider.fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, MovieProvider provider, _) {
          if (provider.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.movie.length,
            itemBuilder: (context, index) {
              final movie = provider.movie[index];
              return ListTile(
                title: Text(movie.title ?? ''),
                onTap: () async {
                  Navigator.pushNamed(context, Screens.detail,
                      arguments: movie.id);
                },
              );
            },
          );
        },
      ),
    );
  }
}

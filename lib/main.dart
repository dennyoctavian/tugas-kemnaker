import 'package:class_kemnaker_denny_octavian/provider/provider.dart';
import 'package:class_kemnaker_denny_octavian/routes/routes.dart';
import 'package:class_kemnaker_denny_octavian/screens/screens.dart';
import 'package:class_kemnaker_denny_octavian/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailProvider(),
        ),
      ],
      child: MaterialApp(
        home: const HomeScreen(),
        initialRoute: Screens.home,
        routes: routes,
      ),
    );
  }
}

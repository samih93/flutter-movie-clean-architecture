import 'package:flutter/material.dart';
import 'package:movie/core/services/services.dart';
import 'package:movie/movies/presentation/controller/movie_controller.dart';
import 'package:movie/movies/presentation/screens/movie_screen/movies_screen.dart';
import 'package:provider/provider.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<MovieController>(
                create: (_) => MovieController(sl(), sl(), sl())),
          ],
          child: MoviesScreen(),
        ));
  }
}

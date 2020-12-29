import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_basics_2/repositories/repositories.dart';
import 'package:flutter_bloc_basics_2/screens/screens.dart';

import 'bloc/bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(
              moviesRepository: MoviesRepository(httpClient: http.Client()))
            ..add(GetMovies()),
        )
      ],
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Verdana",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(brightness: Brightness.dark),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

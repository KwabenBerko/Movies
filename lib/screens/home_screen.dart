import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/movie_model.dart';
import 'package:flutter_bloc_basics_2/screens/screens.dart';
import 'package:flutter_bloc_basics_2/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        child: Container(
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            iconSize: 30,
            backgroundColor: Color(0xFF1B1B1D),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded), label: "Favourites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Me")
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF0B0B0C),
      appBar: TopBar(),
      body: WillPopScope(
        onWillPop: () async {
          _navigatorKey.currentState.maybePop();
          return false;
        },
        child: Navigator(
          key: _navigatorKey,
          initialRoute: MoviesScreen.routeName,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case MoviesScreen.routeName:
                return MaterialPageRoute(builder: (_) => MoviesScreen());
              default:
                return MaterialPageRoute(
                    builder: (_) => MovieDetailsScreen(
                          movie: settings.arguments as Movie,
                        ));
            }
          },
        ),
      ),
    );
  }
}

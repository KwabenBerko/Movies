import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final String _movieTitle;
  final int _releaseDate;
  final double _fontSize;
  final int _maxLines;

  const MovieTitle({
    Key key,
    @required String movieTitle,
    @required int releaseDate,
    @required double fontSize,
    @required int maxLines,
  })  : _movieTitle = movieTitle,
        _releaseDate = releaseDate,
        _fontSize = fontSize,
        _maxLines = maxLines,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          _movieTitle,
          maxLines: _maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontSize: _fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 3.0,
        ),
        Text(
          "($_releaseDate)",
          style: TextStyle(
              color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

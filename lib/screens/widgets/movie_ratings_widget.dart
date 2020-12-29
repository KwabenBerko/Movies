import 'package:flutter/material.dart';

class MovieRatings extends StatelessWidget {
  final double _ratings;
  const MovieRatings({Key key, @required double ratings})
      : _ratings = ratings,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Color(0xFFEBCD72),
            size: 18.0,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(
            "$_ratings",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

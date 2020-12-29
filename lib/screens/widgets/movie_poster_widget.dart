import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String _imageUrl;

  const MoviePoster({
    Key key,
    @required String imageUrl,
  })  : _imageUrl = imageUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: CachedNetworkImage(
          imageUrl: "$_imageUrl",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

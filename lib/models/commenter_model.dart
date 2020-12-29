import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';

class Commenter extends Equatable {
  final String name;
  final String imageUrl;

  const Commenter({@required this.name, @required this.imageUrl});

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, imageUrl];
}

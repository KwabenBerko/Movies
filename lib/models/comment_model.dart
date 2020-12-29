import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';

class Comment extends Equatable {
  final Commenter commenter;
  final String text;
  final DateTime createdAt;

  const Comment({
    @required this.commenter,
    @required this.text,
    @required this.createdAt,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [commenter, text, createdAt];
}

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Actor extends Equatable {
  final String name;

  const Actor({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;
}

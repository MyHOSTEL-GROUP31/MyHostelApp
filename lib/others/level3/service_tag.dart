import 'package:flutter/material.dart';

class ServiceTag {
  final String name;

  final Color color;

  const ServiceTag({required this.name, required this.color})
      : assert(name != null),
        assert(color != null);

  @override
  String toString() => 'Service{name: $name\n,  color: $color}';

  ServiceTag copyWith({String? name, Color? color}) =>
      ServiceTag(name: name ?? this.name, color: color ?? this.color);
}

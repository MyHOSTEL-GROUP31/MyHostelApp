import 'package:flutter/material.dart';

class ServiceTag {
  final String name;
  //final String iconUrl;
  final Color color;

  const ServiceTag({required this.name, required this.color})
      //required this.iconUrl,
      : assert(name != null),
        assert(color != null);

  @override
  String toString() => 'Service{name: $name\n,  color: $color}';
  //iconUrl: $iconUrl\n,

  ServiceTag copyWith({String? name, Color? color}) => ServiceTag(
      name: name ?? this.name,
      // iconUrl: iconUrl ?? this.iconUrl,
      color: color ?? this.color);
  //String? iconUrl,
}

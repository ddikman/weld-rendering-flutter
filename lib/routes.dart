import 'package:flutter/material.dart';

typedef RouteBuilder = Widget Function(BuildContext ctx, Object? parameters);

class Routes {
  final Map<String, RouteBuilder> builders;

  const Routes({this.builders = const {}});

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final builder = builders[settings.name];
    if (builder == null) return null;

    return MaterialPageRoute(builder: (ctx) => builder(ctx, settings.arguments));
  }
}
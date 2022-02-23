import 'package:flutter/cupertino.dart';

// This is just a helpful widget to simplify an example of navigation
class ExampleNavigation extends StatelessWidget {
  final Widget child;
  final String parameter;

  const ExampleNavigation({Key? key, required this.child, required this.parameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('example', arguments: parameter),
      child: child,
    );
  }
}
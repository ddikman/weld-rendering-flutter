import 'package:flutter/cupertino.dart';

import '../theme_variables.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const HorizontalList({Key? key, required this.title, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return Container();

    final childrenPadded = _divideWidgets(children, Container(width: ThemeVars.listItemPadding));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ThemeVars.pagePadding),
          child: Text(title, style: ThemeVars.listHeader),
        ),
        Container(height: ThemeVars.verticalItemPadding),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ThemeVars.pagePadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: childrenPadded
            ),
          )
        )
      ],
    );
  }

  List<Widget> _divideWidgets(List<Widget> children, Container divider) {
    final divided = [ children[0] ];
    for (final item in children.skip(1)) {
      divided.add(divider);
      divided.add(item);
    }
    return divided;
  }
}
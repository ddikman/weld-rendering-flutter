import 'package:flutter/cupertino.dart';
import 'package:weld_rendering_flutter/widgets/example_navigation.dart';

import '../theme_variables.dart';

class ShopEntry extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ShopEntry({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 70.0;
    return ExampleNavigation(
      parameter: name,
      child: SizedBox(
        width: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(size / 2.0)),
              child: SizedBox(width: size, height: size, child: Image.network(imageUrl)),
            ),
            const SizedBox(height: ThemeVars.listItemPadding),
            Text(name, maxLines: 2, style: const TextStyle(color: Color(0xFFAAA9A3), fontSize: 10.0), textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
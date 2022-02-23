import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/theme_variables.dart';
import 'package:weld_rendering_flutter/widgets/example_navigation.dart';
import 'package:weld_rendering_flutter/widgets/url_helper.dart';

class BannerWidget extends StatelessWidget {
  final String url;
  final String title;

  const BannerWidget({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleNavigation(
      parameter: title,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeVars.pagePadding),
        child: ClipRRect(
          child: Container(color: Colors.grey, height: 150, child: FittedBox(fit: BoxFit.cover, child: Image.network(url))),
          borderRadius: const BorderRadius.all(ThemeVars.borderRadius),
        ),
      ),
    );
  }

  static BannerWidget builder(BuildContext ctx, String title, dynamic data) {
    final imageUrl = getImageUrlFromId(data["image_id"]);
    return BannerWidget(url: imageUrl, title: title);
  }
}
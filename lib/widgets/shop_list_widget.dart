import 'package:flutter/cupertino.dart';
import 'package:weld_rendering_flutter/widgets/horizontal_list.dart';
import 'package:weld_rendering_flutter/widgets/url_helper.dart';

import 'shop_entry.dart';

class ShopListWidget extends StatelessWidget {
  final String title;
  final List<ShopDefinition> shops;

  const ShopListWidget({Key? key, required this.title, required this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> shopWidgets = shops.map((e) => ShopEntry(name: e.name, imageUrl: e.imageUrl)).toList();
    return HorizontalList(
        title: title,
        children: shopWidgets
    );
  }

  static ShopListWidget builder(BuildContext ctx, String title, dynamic data) {
    final List<dynamic> shopEntries = data['items'];
    final shops = shopEntries.map((e) => ShopDefinition.parse(e)).toList();
    return ShopListWidget(title: title, shops: shops);
  }
}

class ShopDefinition {
  final String imageUrl;
  final String name;

  ShopDefinition(this.imageUrl, this.name);

  static ShopDefinition parse(dynamic data) {
    return ShopDefinition(
      getImageUrlFromId(data['logo']),
      data['name']
    );
  }
}
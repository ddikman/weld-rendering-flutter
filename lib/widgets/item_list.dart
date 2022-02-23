import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/widgets/item_card.dart';
import 'package:weld_rendering_flutter/widgets/url_helper.dart';
import 'package:intl/intl.dart';

import 'horizontal_list.dart';

class ItemList extends StatelessWidget {
  final String title;
  final List<ItemDefinition> items;

  const ItemList({Key? key, required this.title, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
      title: title,
      children: items.map((e) {
        return ItemCard(
          imageUrl: e.imageUrl,
          brand: e.brand,
          price: e.price,
        );
      }).toList()
    );
  }

  static Widget builder(BuildContext ctx, String title, dynamic data) {
    List<dynamic> items = data['items'];
    final definitions = items.map((e) => ItemDefinition.parse(e)).toList();
    return ItemList(title: title, items: definitions);
  }
}

class ItemDefinition {
  final String imageUrl;
  final String brand;
  final String price;

  ItemDefinition(this.imageUrl, this.brand, this.price);

  static ItemDefinition from(String imageId, String brand, double price) {
    return ItemDefinition(
      getImageUrlFromId(imageId),
      brand,
      _formatPrice(price)
    );
  }

  static ItemDefinition parse(dynamic data) {
    return ItemDefinition.from(
        data['image'],
        data['brand'],
        data['price_with_tax']
    );
  }

  static String _formatPrice(double price) {
    return NumberFormat.currency(locale: 'ja_JP', symbol: '¥').format(price);
  }
}
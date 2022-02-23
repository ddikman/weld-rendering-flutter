import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/routes.dart';
import 'package:weld_rendering_flutter/widget_resolver.dart';
import 'package:weld_rendering_flutter/widgets/banner_widget.dart';
import 'package:weld_rendering_flutter/widgets/local_recent_items_widget.dart';

import 'example_page.dart';
import 'list_page.dart';
import 'widgets/item_list.dart';
import 'widgets/shop_list_widget.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetResolver = WidgetResolver({
      'banner': BannerWidget.builder,
      'item_list': ItemList.builder,
      'local_recent_items': LocalRecentItemsWidget.builder,
      'shop_list': ShopListWidget.builder
    });

    final routes = Routes(builders: {
      'list': (ctx, params) => ListPage(widgetResolver: widgetResolver),
      'example': (ctx, params) => ExamplePage(contents: params.toString())
    });

    return MaterialApp(
      onGenerateRoute: routes.generateRoute,
      initialRoute: 'list'
    );
  }
}
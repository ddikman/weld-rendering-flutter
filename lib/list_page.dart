import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/widget_resolver.dart';
import 'package:weld_rendering_flutter/widget_service.dart';

import 'widget_list.dart';
import 'widgets/widget_definition.dart';

class ListPage extends StatelessWidget {
  final WidgetResolver widgetResolver;

  const ListPage({Key? key, required this.widgetResolver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: FutureBuilder(
        future: WidgetService(DefaultAssetBundle.of(context)).getWidgets(),
        builder: (ctx, AsyncSnapshot<List<WidgetDefinition>> snapshot) {
          if (snapshot.hasData) {
            return WidgetList(widgets: snapshot.data!, widgetResolver: widgetResolver);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
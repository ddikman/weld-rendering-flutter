import 'package:flutter/cupertino.dart';
import 'package:weld_rendering_flutter/widgets/widget_definition.dart';

typedef ListWidgetBuilder = Widget Function(BuildContext context, String title, dynamic data);

class WidgetResolver {
  final Map<String, ListWidgetBuilder> builders;

  WidgetResolver(this.builders);

  bool canResolve(WidgetDefinition definition) {
    return builders.containsKey(definition.type);
  }

  Widget resolve({required WidgetDefinition definition, required BuildContext context}) {
    final builder = builders[definition.type];
    if (builder == null) {
      throw Exception("Cannot resolve widget: ${definition.type}");
    }

    return builder(context, definition.title, definition.data);
  }
}


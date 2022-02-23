import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/theme_variables.dart';
import 'package:weld_rendering_flutter/widget_resolver.dart';

import 'widgets/widget_definition.dart';

class WidgetList extends StatefulWidget {
  final List<WidgetDefinition> widgets;
  final WidgetResolver widgetResolver;

  const WidgetList({Key? key, required this.widgets, required this.widgetResolver}) : super(key: key);

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {

  late List<WidgetDefinition> definitions;

  @override
  void initState() {
    setState(() {
      definitions = widget.widgets.where((definition) => widget.widgetResolver.canResolve(definition)).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ThemeVars.verticalItemPadding),
      child: ListView.separated(
        itemCount: definitions.length,
        itemBuilder: (ctx, index) {
          return widget.widgetResolver.resolve(
            definition: definitions[index],
            context: ctx
          );
        },
        separatorBuilder: (ctx, _) => Container(height: ThemeVars.verticalItemPadding),
      ),
    );
  }
}
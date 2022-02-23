import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'widgets/widget_definition.dart';

class WidgetService {
  final AssetBundle assetBundle;

  WidgetService(this.assetBundle);

  Future<List<WidgetDefinition>> getWidgets() async {
    String jsonString = await assetBundle.loadString('assets/definitions.json');
    final json = jsonDecode(jsonString);
    final List<dynamic> widgets = json['widgets'];
    return widgets.map((e) => WidgetDefinition.parse(e)).toList();
  }
}
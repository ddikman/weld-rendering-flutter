class WidgetDefinition {
  final String type;
  final String title;
  final dynamic data;

  WidgetDefinition(this.type, this.title, this.data);

  static WidgetDefinition parse(dynamic json) {
    return WidgetDefinition(
      json['type'],
      json['title'],
      json['data']
    );
  }
}
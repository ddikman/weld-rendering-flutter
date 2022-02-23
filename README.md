# weld_rendering_flutter

Example of how to render a Widget Definition List (WeLD) in Flutter.

![screenshot](screenshot.gif)

## Structure

The [lib/app_root.dart](lib/app_root.dart) maps up routes in the app, just a list and an example page to show how navigation works. More importantly it defines the different widgets supported which decouples the actual widget list and all widgets from each other. Even the definition we download from how these widgets are rendered.

When we add new widgets we would add it to this list and that's it.

```dart
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
```

When the [assets/definitions.json](assets/definitions.json) is parsed by [lib/widget_service.dart](lib/widget_service.dart) these are then passed to the [lib/widget_resolver.dart](lib/widget_resolver.dart) which uses the mapping above to determine if a widget can be rendered and then to generate the actual widget for this widget.

I realise the naming here is a bit bad because `widget` is an actual thing in Flutter but basically, each section in the definition is called a `widget` as well. 

## Building and running

You'll have to have Flutter installed. Check out the [flutter docs](https://docs.flutter.dev/get-started/install) on how to do that.

Then, you can basically just run `flutter run` and you'll run it on whatever simulator or device you have connected.

Personally, I prefer to work with flutter using [Android Studio](https://developer.android.com/studio) which has IDE support for what you need to run Flutter as well.

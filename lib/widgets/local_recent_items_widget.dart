import 'package:flutter/cupertino.dart';
import 'package:weld_rendering_flutter/widgets/item_list.dart';

class LocalRecentItemsWidget extends StatelessWidget {
  final String title;

  const LocalRecentItemsWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mockLocalItems = [
      ItemDefinition.from('b80b5f50-92ec-449f-9792-85a0b7f102d9', 'Chanel', 3000),
      ItemDefinition.from('768b2d15-66ae-4f56-8e34-69315ea50f7b', 'SAINT JAMES', 13400),
      ItemDefinition.from('6c27211e-73af-42e7-828a-876650d43d02', 'Adam et Rope', 4500),
      ItemDefinition.from('6e2fa2b7-79cb-4bf0-8f11-f93125c7af48', 'JOURNAL STANDARD', 6690),
      ItemDefinition.from('df59875e-ee99-43ce-82ad-9e6bc13d4f19', 'JOURNAL STANDARD', 8990)
    ];
    return ItemList(title: title, items: mockLocalItems);
  }

  static Widget builder(BuildContext ctx, String title, dynamic data) {
    return LocalRecentItemsWidget(title: title);
  }
}
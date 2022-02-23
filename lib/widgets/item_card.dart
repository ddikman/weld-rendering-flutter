import 'package:flutter/material.dart';
import 'package:weld_rendering_flutter/theme_variables.dart';
import 'package:weld_rendering_flutter/widgets/example_navigation.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String brand;
  final String price;

  const ItemCard({Key? key, required this.imageUrl, required this.brand, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleNavigation(
      parameter: 'Item costing $price from $brand',
      child: Padding(
        padding: const EdgeInsets.all(8.0), // to not clip the radius
        child: Container(
          width: 126.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(ThemeVars.borderRadius),
            boxShadow: ThemeVars.shadow,
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 127.0,
                width: 126.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: ThemeVars.borderRadius,
                    topRight: ThemeVars.borderRadius,
                  ),
                  child: FittedBox(child: Image.network(imageUrl, fit: BoxFit.fill))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 2, right: 10),
                child: Text(brand.toUpperCase(), style: const TextStyle(color: Color(0xFFAAA9A3), fontWeight: FontWeight.bold, fontSize: 10.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(price, style: const TextStyle(fontSize: 12)),
                    const Text("(税込)", style: TextStyle(fontSize: 10))
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:cafe_pra_ja/app_state.dart';
import 'package:provider/provider.dart';

class CafeGridView extends StatefulWidget {
  const CafeGridView({super.key});

  @override
  State<CafeGridView> createState() => _CafeGridViewState();
}

class _CafeGridViewState extends State<CafeGridView> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: theme.surfaceContainerHighest,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    "assets/images/list.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'nme',
                  style: TextStyle(
                    color: theme.onPrimaryContainer,
                    fontSize: textTheme.bodyLarge?.fontSize,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "R\$ 22",
                      style: TextStyle(
                        color: theme.onPrimaryContainer,
                        fontSize: textTheme.titleLarge?.fontSize,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.secondary,
                      ),
                      child: Icon(Icons.add, color: theme.onSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


*/

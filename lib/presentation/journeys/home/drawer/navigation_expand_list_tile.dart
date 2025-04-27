import 'package:flutter/material.dart';
import 'package:movie_app/presentation/journeys/home/drawer/navigation_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final ValueChanged<int> onPressed;

  const NavigationExpandedListItem({
    super.key,
    required this.title,
    required this.children,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        children: children.asMap().entries.map((entry) {
          final index = entry.key;
          final childTitle = entry.value;
          return NavigationSubListItem(
            title: childTitle,
            onPressed: () => onPressed(index),
          );
        }).toList(),
      ),
    );
  }
}

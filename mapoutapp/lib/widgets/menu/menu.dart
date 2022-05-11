// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:floating_action_row/floating_action_row.dart';
import 'package:flutter/material.dart';

class FloatingMenu extends StatefulWidget {
  const FloatingMenu({Key? key}) : super(key: key);

  @override
  State<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends State<FloatingMenu> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    
    children.add(FloatingActionRowButton(icon: const Icon(Icons.zoom_in_map_outlined), onTap: (){}));
    children.add(const SizedBox(width: 10));
    children.add(FloatingActionRowButton(icon: const Icon(Icons.chat_bubble_outline_outlined), onTap: (){}));
    children.add(const SizedBox(width: 10));
    children.add(FloatingActionRowButton(icon: const Icon(Icons.person), onTap: (){}));

    return Scaffold(
      floatingActionButton: FloatingActionRow(
        color: Colors.white,
        elevation: 4,
        children: children,
      ),
    );
  }
}
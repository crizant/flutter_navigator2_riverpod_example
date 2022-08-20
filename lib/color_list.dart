import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_riverpod_example/service_locator.dart';
import 'color_detail.dart';

class ColorList extends ConsumerWidget {
  const ColorList({Key? key}) : super(key: key);

  void onPressed(WidgetRef ref, Color color) {
    ref.read(activeColorProvider.notifier).state = color;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Colors'),
      ),
      body: ListView(
        children: [
          ColorItem(
            color: Colors.red,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.orange,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.yellow,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.green,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.cyan,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.blue,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
          ColorItem(
            color: Colors.purple,
            onPressed: (color) {
              onPressed(ref, color);
            },
          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color color;
  final void Function(Color) onPressed;

  const ColorItem({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () {
          onPressed(color);
        },
        child: const SizedBox(
          height: 45.0,
        ),
      ),
    );
  }
}

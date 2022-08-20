import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator2_riverpod_example/color_detail.dart';
import 'package:navigator2_riverpod_example/service_locator.dart';
import 'color_list.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeColor = ref.watch(activeColorProvider);
    return MaterialApp(
      home: Navigator(
        pages: [
          const MaterialPage(
            name: 'color_list',
            child: ColorList(),
          ),
          if (activeColor != null)
            MaterialPage(
              name: 'color_detail',
              child: ColorDetail(color: activeColor),
            ),
        ],
        onPopPage: (route, result) {
          if (route.settings.name == 'color_detail') {
            ref.read(activeColorProvider.notifier).state = null;
          }
          return route.didPop(result);
        },
      ),
    );
  }
}

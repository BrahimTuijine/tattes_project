import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/features/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1000, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "tattes project";
    win.show();
  });

  // await getIt<MyDatabase>().into(getIt<MyDatabase>().categories).insert(  CategoriesCompanion.insert(description: 'hhello'));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class SecondPage extends HookWidget {
  final PageController controller;
  const SecondPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Button(
          onPressed: () {
            controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn);
          },
          child: const Text(
            "Elevated Button",
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends HookWidget {
  final int number;
  const ThirdPage({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Center(
        child: Text('ThirdPage $number'),
      ),
    );
  }
}

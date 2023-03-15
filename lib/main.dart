import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/widgets/data_table.dart';

void main() async {
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

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  final closeButtonColors = WindowButtonColors(
      mouseOver: const Color(0xFFD32F2F),
      mouseDown: const Color(0xFFB71C1C),
      iconNormal: const Color(0xFF805306),
      iconMouseOver: Colors.white);

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final currentIndex = useState<int>(0);
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MinimizeWindowButton(animate: true),
            appWindow.isMaximized
                ? RestoreWindowButton(
                    colors: WindowButtonColors(mouseOver: Colors.blue),
                  )
                : MaximizeWindowButton(
                    colors: WindowButtonColors(mouseOver: Colors.blue),
                  ),
            CloseWindowButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return ContentDialog(
                      title: const Text('Confirm close'),
                      content: const Text(
                          'Are you sure you want to close this window?'),
                      actions: [
                        FilledButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.pop(context);
                            appWindow.close();
                          },
                        ),
                        Button(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      pane: NavigationPane(
        indicator: StickyNavigationIndicator(color: Colors.green),
        header: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Ahla tattes',
            style: FluentTheme.of(context).typography.title,
          ),
        ),
        items: <NavigationPaneItem>[
          PaneItem(
            selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
            body: const FirstPage(),
            icon: const Icon(FluentIcons.home),
            title: const Text(
              'home Page',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          PaneItemHeader(
            header: const Text('Create'),
          ),
          PaneItem(
            selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
            body: const FirstPage(),
            icon: const Icon(
              FluentIcons.edit_contact,
            ),
            title: const Text('client'),
          ),
          PaneItem(
            selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
            body: const FirstPage(),
            icon: const Icon(
              FluentIcons.product_variant,
            ),
            title: const Text('products'),
          ),
          PaneItem(
            selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
            body: const FirstPage(),
            icon: const Icon(FluentIcons.production_floor_management),
            title: const Text('supplier'),
          ),
          PaneItemHeader(header: const Text('List')),
          PaneItem(
              selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
              icon: const Icon(FluentIcons.screen),
              title: const Text('second screen'),
              body: PageView(
                controller: controller,
                children: [
                  SecondPage(
                    controller: controller,
                  ),
                  const ThirdPage(number: 3)
                ],
              )),
          PaneItemSeparator(color: Colors.black, thickness: .3),
          PaneItem(
            selectedTileColor: ButtonState.all(Colors.green.withOpacity(.2)),
            icon: const Icon(FluentIcons.screen),
            title: const Text('second screen'),
            body: const DataTable2SimpleDemo(),
          ),
        ],
        selected: currentIndex.value,
        onChanged: (value) {
          currentIndex.value = value;
        },
      ),
    );
  }
}

class FirstPage extends HookWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      content: Center(
        child: Text('first page'),
      ),
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

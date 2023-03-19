import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/data_table.dart';
import 'package:products_management/features/createClient/presentation/pages/create_client.dart';
import 'package:products_management/features/createProduct/presentation/pages/create_product.dart';
import 'package:products_management/features/createSupplier/presentation/pages/create_supplier.dart';
import 'package:products_management/main.dart';

class HomePage extends HookWidget {
  HomePage({Key? key}) : super(key: key);

  final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white,
  );

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
        indicator: const StickyNavigationIndicator(color: Colors.grey),
        header: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Ahla tattes',
            style: FluentTheme.of(context).typography.title,
          ),
        ),
        items: <NavigationPaneItem>[
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xFF01706E).withOpacity(.25)),
            body: const Text('dashboard'),
            icon: const Icon(FluentIcons.home),
            title: const Text(
              'home Page',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          PaneItemHeader(
            header: const Text('Creation'),
          ),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xFF01706E).withOpacity(.25)),
            body: CreateClient(),
            icon: const Icon(
              FluentIcons.edit_contact,
            ),
            title: const Text('client'),
          ),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xFF01706E).withOpacity(.25)),
            body: CreateProduct(),
            icon: const Icon(
              FluentIcons.product_variant,
            ),
            title: const Text('produit'),
          ),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xFF01706E).withOpacity(.25)),
            body: CreateSuppler(),
            icon: const Icon(FluentIcons.production_floor_management),
            title: const Text('fournisseur'),
          ),
          PaneItemHeader(header: const Text('List')),
          PaneItem(
            selectedTileColor:
                ButtonState.all(const Color(0xFF01706E).withOpacity(.25)),
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
            ),
          ),
          // PaneItemSeparator(color: Colors.black, thickness: .3),
          PaneItem(
            selectedTileColor: ButtonState.all(lightGreen),
            icon: const Icon(FluentIcons.screen),
            title: const Text('second screen'),
            body: DataTable2SimpleDemo(),
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

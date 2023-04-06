import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/product.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/features/createBonLivraison/widgets/prodcut_form.dart';
import 'package:products_management/injection.dart';

class CreateUpdateBonLivraison extends HookWidget {
  CreateUpdateBonLivraison({
    super.key,
    this.bonLivraison,
    required this.refresh,
  });

  final BonLivraison? bonLivraison;
  final ValueNotifier<bool> refresh;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> bonLivraisonData = {'clientName': ''};

  final List<ProductModel> productList = [
    ProductModel(nbrCol: '', productName: '')
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<List<Client>>(
            future: getIt<MyDatabase>().getClients(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'les fournissers',
                        style: TextStyle(
                            color: blueGreen, fontWeight: FontWeight.bold),
                      ),
                      Autocomplete<Client>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return snapshot.data!
                              .where((Client element) => element.name
                                  .toLowerCase()
                                  .contains(
                                      textEditingValue.text.toLowerCase()))
                              .toList();
                        },
                        displayStringForOption: (Client option) => option.name,
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController fieldTextEditingController,
                            FocusNode fieldFocusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blueGreen),
                              ),
                              filled: false,
                              hintText: 'liste des fournissers',
                              hintStyle: TextStyle(color: grey, fontSize: 13),
                            ),
                            controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                            style: const TextStyle(),
                          );
                        },
                        onSelected: (Client selection) {},
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<Client> onSelected,
                            Iterable<Client> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [kDefaultShadow],
                                color: Colors.white,
                              ),
                              width: 250,
                              height: 200,
                              child: Material(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(10.0),
                                  itemCount: options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Client option =
                                        options.elementAt(index);

                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option.name,
                                            style: const TextStyle(
                                                color: Colors.black)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(
            height: 40,
          ),
          // HookBuilder(builder: (context) {

          // return
          HookBuilder(builder: (context) {
            final refresh = useState<bool>(true);
            return SizedBox(
              height: 200,
              width: 510,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductForm(
                    onDelete: () {
                      productList.removeAt(index);
                      refresh.value = !refresh.value;
                    },
                    productModel: productList[index],
                    onAdd: () {
                      productList
                          .add(ProductModel(nbrCol: '', productName: ''));
                      refresh.value = !refresh.value;
                    },
                  );
                  // return forms[index];
                },
              ),
            );
          }),
          // }),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevButton(
              bgColor: blueGreen,
              onpressed: () {
                formKey.currentState!.validate();
              },
              text: bonLivraison?.id != null ? 'mise à jour' : 'créer',
            ),
          ),
        ],
      ),
    );
  }
}

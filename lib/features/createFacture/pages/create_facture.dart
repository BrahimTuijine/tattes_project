// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/product.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/features/createBonLivraison/widgets/prodcut_form.dart';
import 'package:products_management/injection.dart';

class CreateFacture extends HookWidget {
  final ValueNotifier<int> currentIndex;
  CreateFacture({
    super.key,
    required this.currentIndex,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> bonLivraisonData = {
    'clientId': '',
  };

  final List<ProductModel> productList = [
    ProductModel(
      nbrCol: 0,
      prix: 0,
      productId: 0,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: double.infinity, minHeight: double.infinity),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<Client>>(
                    future: getIt<MyDatabase>().getClients(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Client>> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'les clients',
                                style: TextStyle(
                                    color: blueGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Autocomplete<Client>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  return snapshot.data!
                                      .where((Client element) => element.name
                                          .toLowerCase()
                                          .contains(textEditingValue.text
                                              .toLowerCase()))
                                      .toList();
                                },
                                displayStringForOption: (Client option) =>
                                    option.name,
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController
                                        fieldTextEditingController,
                                    FocusNode fieldFocusNode,
                                    VoidCallback onFieldSubmitted) {
                                  return TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "ma yelzmouch ykoun fara4";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: false,
                                      hintText: 'liste des clients',
                                      hintStyle: const TextStyle(
                                          color: grey, fontSize: 13),
                                    ),
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                    style: const TextStyle(),
                                  );
                                },
                                onSelected: (Client selection) {
                                  bonLivraisonData['clientId'] = selection.id;
                                },
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                  HookBuilder(builder: (context) {
                    final refresh = useState<bool>(true);
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductForm(
                          onDelete: () {
                            if (productList.length > 1) {
                              productList.removeAt(index);
                              refresh.value = !refresh.value;
                            }
                          },
                          productModel: productList[index],
                          onAdd: () {
                            productList.add(ProductModel(
                              nbrCol: 0,
                              prix: 0,
                              productId: 0,
                            ));
                            refresh.value = !refresh.value;
                          },
                        );
                      },
                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevButton(
                      bgColor: blueGreen,
                      onpressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final int bonLivraisonId =
                              await getIt<MyDatabase>().insertFacture(
                            FactureCompanion.insert(
                              factureId: 'lazem yetbadel',
                              clientId: bonLivraisonData['clientId'],
                            ),
                          );

                          for (var i = 0; i < productList.length; i++) {
                            getIt<MyDatabase>().insertFactureProduct(
                                FactureProdCompanion.insert(
                              productId: productList[i].productId,
                              bonLivraisonId: bonLivraisonId,
                              nbrCol: productList[i].nbrCol,
                              newProductPrice: productList[i].prix,
                            ));
                          }
                          currentIndex.value = 5;
                        }
                      },
                      text: 'créer',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

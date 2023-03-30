// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';
import 'package:products_management/injection.dart';

class CreateUpdateProduct extends HookWidget {
  CreateUpdateProduct({
    super.key,
    this.product,
    required this.refresh,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Product? product;

  final Map<String, dynamic> productData = {
    "libelle": '',
    "prix": 0,
    "categorie": '',
    "description": '',
    "nbPiece": '',
    'fournisser': '',
    'prixOrTax': ''
  };

  String prixOrTax({required int prixTtc, required double tva}) {
    return (prixTtc - (prixTtc * tva)).toString();
  }

  final ValueNotifier<bool> refresh;

  @override
  Widget build(BuildContext context) {
    final selectedTva =
        useState<double>(product?.tva == null ? 0 : double.parse(product!.tva));
    final prixTtc =
        useState<int>(product?.prix == null ? 0 : int.parse(product!.prix));

    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: InputField(
                      initvalue: product?.libelle,
                      label: 'Libellé',
                      texthint: 'libellé',
                      onsaved: (newValue) {
                        productData['libelle'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: InputField(
                      // controller: prixController,
                      onChanged: (prix) {
                        try {
                          int.tryParse(prix);
                          prixTtc.value = int.parse(prix);
                        } catch (e) {
                          prixTtc.value = 0;
                        }
                      },
                      initvalue: product?.prix ?? "0",
                      label: 'Prix',
                      texthint: 'prix',
                      onsaved: (newValue) {
                        productData['prix'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: InputField(
                      initvalue: product?.categorie,
                      label: 'categorie',
                      texthint: 'categorie',
                      onsaved: (newValue) {
                        productData['categorie'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TVA',
                        style: TextStyle(
                            color: blueGreen, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 300,
                        child: DropdownButton<double>(
                          dropdownColor: Colors.white,
                          value: selectedTva.value,
                          items: const [
                            DropdownMenuItem(
                              value: 0,
                              child: Text('0 %'),
                            ),
                            DropdownMenuItem(
                              value: .07,
                              child: Text('7 %'),
                            ),
                            DropdownMenuItem(
                              value: .19,
                              child: Text('19 %'),
                            ),
                          ],
                          onChanged: (value) {
                            selectedTva.value = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  FutureBuilder(
                    future: getIt<MyDatabase>().getSuppliers(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Fournisser>> snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'les fournissers',
                                style: TextStyle(
                                    color: blueGreen,
                                    fontWeight: FontWeight.bold),
                              ),
                              RawAutocomplete<Fournisser>(
                                initialValue: TextEditingValue(
                                  text: product?.fournisser ?? '',
                                ),
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  return snapshot.data!
                                      .where((Fournisser county) => county.name
                                          .toLowerCase()
                                          .contains(textEditingValue.text
                                              .toLowerCase()))
                                      .toList();
                                },
                                displayStringForOption: (Fournisser option) =>
                                    option.name,
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController
                                        fieldTextEditingController,
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
                                        borderSide:
                                            BorderSide(color: blueGreen),
                                      ),
                                      filled: false,
                                      hintText: 'liste des fournissers',
                                      hintStyle:
                                          TextStyle(color: grey, fontSize: 13),
                                    ),
                                    controller: fieldTextEditingController,
                                    focusNode: fieldFocusNode,
                                    style: const TextStyle(),
                                  );
                                },
                                onSelected: (Fournisser selection) {
                                  productData['fournisser'] = selection.name;
                                },
                                optionsViewBuilder: (BuildContext context,
                                    AutocompleteOnSelected<Fournisser>
                                        onSelected,
                                    Iterable<Fournisser> options) {
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
                                            final Fournisser option =
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
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: InputField(
                      initvalue: product?.nbrePiece,
                      label: 'nombre de piece',
                      texthint: '10',
                      onsaved: (newValue) {
                        productData['nbPiece'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 300,
                    child: InputField(
                      initvalue: product?.description,
                      label: 'Description',
                      texthint: 'description',
                      onsaved: (newValue) {
                        productData['description'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Prix or tax',
                            style: TextStyle(
                                color: blueGreen, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(prixOrTax(
                              prixTtc: prixTtc.value, tva: selectedTva.value)),
                        ],
                      )),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevButton(
            bgColor: blueGreen,
            onpressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                if (product?.id != null) {
                  try {
                    final entity = ProductsCompanion(
                      prixOrTax: drift.Value(
                        prixOrTax(
                            prixTtc: prixTtc.value, tva: selectedTva.value),
                      ),
                      fournisser: drift.Value(productData['fournisser'] == ''
                          ? product!.fournisser
                          : productData['fournisser']),
                      id: drift.Value(product!.id),
                      nbrePiece: drift.Value(productData['nbPiece']),
                      prix: drift.Value(productData['prix']),
                      tva: drift.Value(selectedTva.value.toString()),
                      categorie: drift.Value(productData['categorie']),
                      libelle: drift.Value(productData['libelle']),
                      description: drift.Value(productData['description']),
                    );

                    getIt<MyDatabase>().updateProduct(entity);

                    Navigator.pop(context);
                    refresh.value = !refresh.value;
                  } catch (e) {
                    MyAlertDialog.showAlertDialog(
                        child: Text('Error : $e'),
                        context: context,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ]);
                  }
                } else {
                  try {
                    final entity = ProductsCompanion(
                      prixOrTax: drift.Value(
                        prixOrTax(
                            prixTtc: prixTtc.value, tva: selectedTva.value),
                      ),
                      fournisser: drift.Value(productData['fournisser']),
                      categorie: drift.Value(productData['categorie']),
                      libelle: drift.Value(productData['libelle']),
                      nbrePiece: drift.Value(productData['nbPiece']),
                      description: drift.Value(productData['description']),
                      prix: drift.Value(productData['prix']),
                      tva: drift.Value(selectedTva.value.toString()),
                    );

                    getIt<MyDatabase>().insertProduct(entity);

                    Navigator.pop(context);
                    refresh.value = !refresh.value;
                  } catch (e) {
                    MyAlertDialog.showAlertDialog(
                        child: Text('Error : $e'),
                        context: context,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ]);
                  }
                }
              }
            },
            text: product?.id != null ? 'mise à jour' : 'créer',
          ),
        ],
      ),
    );
  }
}

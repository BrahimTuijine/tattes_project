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
    this.libelle,
    this.id,
    this.name,
    this.nbPiece,
    this.categorie,
    this.prix,
    this.tva,
    this.description,
    required this.refresh,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String? libelle;
  final int? id;
  final String? name;
  final String? nbPiece;
  final String? categorie;
  final String? prix;
  final String? tva;
  final String? description;

  final Map<String, dynamic> productData = {
    "libelle": '',
    "tva": '',
    "prix": 0,
    "categorie": '',
    "description": '',
    "nbPiece": '',
    'fournisser': '',
    'prixOrTax': ''
  };

  final ValueNotifier<bool> refresh;

  @override
  Widget build(BuildContext context) {
    final selectedTva = useState<double>(0);
    final prixTtc = useState<int>(0);
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
                      initvalue: libelle,
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
                        print(prix);
                        try {
                          int.parse(prix);
                          prixTtc.value = int.parse(prix);
                        } catch (e) {
                          print(e);
                        }
                      },
                      initvalue: prix ?? "0",
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
                      initvalue: categorie,
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
                              child: Text('0'),
                            ),
                            DropdownMenuItem(
                              value: .07,
                              child: Text('7'),
                            ),
                            DropdownMenuItem(
                              value: .19,
                              child: Text('19'),
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
                              Autocomplete<Fournisser>(
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
                                        // border: Border.all(),
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
                      initvalue: nbPiece,
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
                      initvalue: description,
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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Prix or tax',
                      style: TextStyle(
                          color: blueGreen, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                      '${prixTtc.value - (prixTtc.value * selectedTva.value)}'),
                  // SizedBox(
                  //   width: 300,
                  //   child: InputField(
                  //     enabled: false,
                  //     texthint: '',
                  //     initvalue:
                  //         '${prixTtc.value - (prixTtc.value * selectedTva.value)}',
                  //     label: 'Prix or tax',
                  //     onsaved: (newValue) {
                  //       productData['prixOrTax'] = newValue;
                  //     },
                  //     validator: (value) {
                  //       return null;
                  //     },
                  //   ),
                  // ),
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

                if (id != null) {
                  try {
                    final entity = ProductsCompanion(
                      fournisser: drift.Value(productData['nbPiece']),
                      id: drift.Value(id!),
                      nbrePiece: drift.Value(productData['nbPiece']),
                      prix: drift.Value(productData['prix']),
                      tva: drift.Value(productData['tva']),
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
                      fournisser: drift.Value(productData['nbPiece']),
                      categorie: drift.Value(productData['categorie']),
                      libelle: drift.Value(productData['libelle']),
                      nbrePiece: drift.Value(productData['nbPiece']),
                      description: drift.Value(productData['description']),
                      prix: drift.Value(productData['prix']),
                      tva: drift.Value(productData['tva']),
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
            text: id != null ? 'update' : 'create',
          ),
        ],
      ),
    );
  }
}

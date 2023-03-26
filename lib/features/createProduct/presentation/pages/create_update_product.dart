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
    this.libelle,
    this.id,
    this.name,
    this.refrence,
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
  final String? refrence;
  final String? categorie;
  final String? prix;
  final String? tva;
  final String? description;

  final Map<String, dynamic> productData = {
    "libelle": '',
    "tva": '',
    "prix": '',
    "categorie": '',
    "refrence": '',
    "image": '',
    "description": ''
  };

  final ValueNotifier<bool> refresh;

  @override
  Widget build(BuildContext context) {
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
                      initvalue: prix,
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
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: InputField(
                      initvalue: tva,
                      label: 'Tva',
                      texthint: 'tva',
                      onsaved: (newValue) {
                        productData['tva'] = newValue;
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
                      initvalue: refrence,
                      label: 'refrence',
                      texthint: 'refrence',
                      onsaved: (newValue) {
                        productData['refrence'] = newValue;
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
                      label: 'description',
                      texthint: 'description',
                      onsaved: (newValue) {
                        productData['description'] = newValue;
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
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
                      id: drift.Value(id!),
                      prix: drift.Value(productData['prix']),
                      tva: drift.Value(productData['tva']),
                      categorie: drift.Value(productData['categorie']),
                      libelle: drift.Value(productData['libelle']),
                      refrence: drift.Value(productData['refrence']),
                      image: drift.Value(productData['image']),
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
                      categorie: drift.Value(productData['categorie']),
                      libelle: drift.Value(productData['libelle']),
                      refrence: drift.Value(productData['refrence']),
                      image: drift.Value(productData['image']),
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

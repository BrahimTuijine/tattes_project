import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';
import 'package:products_management/injection.dart';
import 'package:drift/drift.dart' as drift;

class CreateUpdateProduct extends HookWidget {
  CreateUpdateProduct({
    super.key,
    this.id,
    this.name,
    this.prix,
    this.tva,
    this.createdAt,
    required this.refresh,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DateTime? createdAt;
  final int? id;
  final String? name;
  final String? prix;
  final String? tva;

  final Map<String, dynamic> productData = {
    "libelle": '',
    "tva": '',
    "prix": '',
    "categorie": '',
    "refrence": '',
    "image": '',
  };

  final ValueNotifier<bool> refresh;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: InputField(
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
          SizedBox(
            width: 300,
            child: InputField(
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
          ElevButton(
            bgColor: blueGreen,
            onpressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                if (id != null) {
                  try {
                    final entity = ProductsCompanion(
                      createdAt: drift.Value(createdAt!),
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
                    getIt<MyDatabase>().insertProduct(
                      ProductsCompanion.insert(
                        categorie: productData['categorie'],
                        libelle: productData['libelle'],
                        refrence: productData['refrence'],
                        image: productData['image'],
                        description: productData['description'],
                        prix: productData['prix'],
                        tva: productData['tva'],
                      ),
                    );
                    Navigator.pop(context);
                    // refresh.value = !refresh.value;
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';
import 'package:products_management/injection.dart';

class CreateUpdateSupplier extends HookWidget {
  CreateUpdateSupplier({
    super.key,
    this.createdAt,
    this.id,
    this.name,
    this.ville,
    this.rue,
    this.phone,
    required this.refresh,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final DateTime? createdAt;
  final int? id;
  final String? name;
  final String? ville;
  final String? rue;
  final String? phone;

  final Map<String, dynamic> clientData = {
    "rue": '',
    "ville": '',
    "name": '',
    "phone": 0,
  };

  final ValueNotifier<bool> refresh;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputField(
            initvalue: name,
            label: 'Name',
            texthint: 'name',
            onsaved: (newValue) {
              clientData['name'] = newValue;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'ma yelzemch ykoun l ism fara4';
              } else if (value.contains(RegExp(r'[0-9]'))) {
                return 'ism alli 7attitou 4alet';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: InputField(
              initvalue: phone,
              label: 'Phone',
              texthint: 'phone',
              onsaved: (newValue) {
                clientData['phone'] = newValue!.trim();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ma yelzemch ykoun fara4';
                } else if (value.length != 8) {
                  return 'noumrou alli ktebtou 4alet';
                }
                try {
                  int.parse(value);
                } on FormatException {
                  return 'noumrou alli ktebtou 4alet';
                }
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
              initvalue: ville,
              label: 'Ville',
              texthint: 'ville',
              onsaved: (newValue) {
                clientData['ville'] = newValue;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ma yelzemch ykoun fara4';
                } else if (value.contains(RegExp(r'[0-9]'))) {
                  return 'ism alli 7attitou 4alet';
                }
                if (value.length > 20) {
                  return 'alli ktebtou twill barcha';
                }
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
              initvalue: rue,
              label: 'Rue',
              texthint: 'rue',
              onsaved: (newValue) {
                clientData['rue'] = newValue;
              },
              validator: (value) {
                if (value.toString().length > 20) {
                  return 'alli ktebtou twill barcha';
                }
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
                    final entity = FournissersCompanion(
                      createdAt: drift.Value(createdAt!),
                      id: drift.Value(id!),
                      rue: drift.Value(clientData['rue']),
                      ville: drift.Value(clientData['ville']),
                      name: drift.Value(clientData['name']),
                      phone: drift.Value(clientData['phone']),
                    );
                    getIt<MyDatabase>().updateSuppliers(entity);

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
                    getIt<MyDatabase>().insertSupplier(
                      FournissersCompanion.insert(
                        rue: clientData['rue'],
                        ville: clientData['ville'],
                        name: clientData['name'],
                        phone: clientData['phone'],
                      ),
                    );
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

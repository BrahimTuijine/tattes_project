import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:drift/drift.dart' as drift;
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: InputField(
              initvalue: bonLivraison?.clientName,
              label: 'clientName',
              texthint: 'clientName',
              onsaved: (newValue) {
                bonLivraisonData['clientName'] = newValue;
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
          ),
          const SizedBox(
            height: 30,
          ),
          ElevButton(
            bgColor: blueGreen,
            onpressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                if (bonLivraison?.id != null) {
                  try {
                    final entity = BonLivraisonsCompanion(
                      createdAt: drift.Value(bonLivraison!.createdAt),
                      id: drift.Value(bonLivraison!.id),
                    );
                    getIt<MyDatabase>().updateBonLisvraison(entity);

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
                    getIt<MyDatabase>().insertBonLisvraison(
                      BonLivraisonsCompanion.insert(
                        clientName: bonLivraisonData['clientName'],
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
            text: bonLivraison?.id != null ? 'mise à jour' : 'créer',
          ),
        ],
      ),
    );
  }
}

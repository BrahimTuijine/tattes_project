import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';
import 'package:products_management/injection.dart';

class CreateClient extends HookWidget {
  CreateClient({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> clientData = {
    "rue": '',
    "ville": '',
    "name": '',
    "phone": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputField(
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
              label: 'Phone',
              texthint: 'phone',
              onsaved: (newValue) {
                clientData['phone'] = int.parse(newValue!);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'ma yelzemch ykoun fara4';
                } else if (value.length != 8) {
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
            onpressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                try {
                  getIt<MyDatabase>().insertClient(
                    ClientsCompanion.insert(
                      rue: clientData['rue'],
                      ville: clientData['ville'],
                      name: clientData['name'],
                      phone: clientData['phone'],
                    ),
                  );
                } catch (e) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: Text('Error : $e'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              }
            },
            text: 'send',
          ),
        ],
      ),
    );
  }
}

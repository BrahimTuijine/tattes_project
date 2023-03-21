import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';

class CreateProduct extends HookWidget {
  CreateProduct({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  

  final Map<String, dynamic> productData = {
    "name": '',
    "prix": '',
    "tva": '',
  };

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
                children: <Widget>[
                  const CustomText(
                    text: 'Creation de produit',
                    color: Colors.grey,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: InputField(
                            label: 'Libellé',
                            texthint: 'libellé',
                            onsaved: (newValue) {
                              productData['name'] = newValue;
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
                        ElevButton(
                          bgColor: blueGreen,
                          onpressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              // await getIt<MyDatabase>()
                              //     .into(getIt<MyDatabase>().produits)
                              //     .insert(ProduitsCompanion.insert(
                              //       prix: productData['prix'],
                              //       tva: productData['tva'],
                              //       name: productData['name'],
                              //     ))
                              //     .then(
                              //       (value) => ScaffoldMessenger.of(context)
                              //           .showMaterialBanner(
                              //         MaterialBanner(
                              //             content: Text(
                              //                 'nouveau produit inséré $value'),
                              //             actions: [
                              //               TextButton(
                              //                 onPressed: () => ScaffoldMessenger
                              //                         .of(context)
                              //                     .hideCurrentMaterialBanner(),
                              //                 child: const Text('Fermer'),
                              //               )
                              //             ]),
                              //       ),
                              //     );
                            }
                          },
                          text: 'send',
                        ),
                      ],
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

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/core/widgets/elevated_btn.dart';
import 'package:products_management/core/widgets/from_field.dart';

class CreateClient extends HookWidget {
  CreateClient({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> clientData = {
    "rue": '',
    "ville": '',
    "name": '',
    "phone": 0,
  };

  late MyDatabase myDatabase;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      myDatabase = MyDatabase();
      return () {
        myDatabase.close();
      };
    }, const []);
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
                    text: 'Creation de client',
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
                            label: 'Name',
                            texthint: 'name',
                            onsaved: (newValue) {
                              clientData['name'] = newValue;
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
                            label: 'Phone',
                            texthint: 'phone',
                            onsaved: (newValue) {
                              // clientData['phone'] = int.parse(newValue!);
                              clientData['phone'] = newValue!;
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
                            label: 'Ville',
                            texthint: 'ville',
                            onsaved: (newValue) {
                              clientData['ville'] = newValue;
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
                            label: 'Rue',
                            texthint: 'rue',
                            onsaved: (newValue) {
                              clientData['rue'] = newValue;
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
                          onpressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              try {
                                myDatabase.insertClient(
                                  ClientsCompanion.insert(
                                    rue: clientData['rue'],
                                    ville: clientData['ville'],
                                    name: clientData['name'],
                                    phone: clientData['phone'],
                                  ),
                                );
                              } catch (e) {
                                
                              }
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

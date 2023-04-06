import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/product.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/injection.dart';

class ProductForm extends HookWidget {
  final ProductModel productModel;
  final void Function() onDelete;
  final void Function() onAdd;

  const ProductForm({
    Key? key,
    required this.productModel,
    required this.onDelete,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder<List<Product>>(
          future: getIt<MyDatabase>().getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Autocomplete<Product>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return snapshot.data!
                            .where((Product element) => element.libelle
                                .toLowerCase()
                                .contains(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      displayStringForOption: (Product option) =>
                          option.libelle,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        return TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: false,
                            hintText: 'liste des produits',
                            hintStyle:
                                const TextStyle(color: grey, fontSize: 13),
                          ),
                          controller: fieldTextEditingController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "ma yelzmouch ykoun fara4";
                            }
                            return null;
                          },
                          focusNode: fieldFocusNode,
                          style: const TextStyle(),
                        );
                      },
                      onSelected: (Product product) {
                        productModel.productName = product.libelle;
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<Product> onSelected,
                          Iterable<Product> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [kDefaultShadow],
                              color: Colors.white,
                            ),
                            width: 250,
                            child: Material(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Product option =
                                      options.elementAt(index);

                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: ListTile(
                                      title: Text(option.libelle,
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
          width: 20,
        ),
        SizedBox(
          width: 80,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Nbr Col',
            ),
            onSaved: (String? newValue) {
              productModel.nbrCol = newValue!;
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "ma yelzmouch ykoun fara4";
              }
              return null;
            },
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

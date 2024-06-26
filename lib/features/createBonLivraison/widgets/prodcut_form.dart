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
    final newPriceController = useTextEditingController();
    final productNumber = useTextEditingController();
    return Row(
      children: [
        FutureBuilder<List<Product>>(
          future: getIt<MyDatabase>().getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: Autocomplete<Product>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return snapshot.data!
                        .where((Product element) => element.libelle
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                        .toList();
                  },
                  displayStringForOption: (Product option) => option.libelle,
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                        hintStyle: const TextStyle(color: grey, fontSize: 13),
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
                    productModel.productId = product.id;
                    newPriceController.text = product.productPrice.toString();
                    productNumber.text = product.nbreProduit.toString();
                    productModel.productNumber = product.nbreProduit;
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
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: Material(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Product option = options.elementAt(index);

                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                },
                                child: ListTile(
                                  title: Text(option.libelle,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
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
          width: 150,
          child: TextFormField(
            controller: productNumber,
            readOnly: true,
            decoration: InputDecoration(
              hintText: '0',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
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
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
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
              productModel.nbrCol = int.parse(newValue!);
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "ma yelzmouch ykoun fara4";
              } else if (int.parse(value) > int.parse(productNumber.text)) {
                return "ma tajjamch tzid akther men stock";
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: newPriceController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
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
              hintText: 'prix',
            ),
            onSaved: (String? newValue) {
              productModel.prix = double.parse(newValue!);
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

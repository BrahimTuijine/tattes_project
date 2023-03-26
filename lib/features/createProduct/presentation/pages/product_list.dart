import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/features/createProduct/presentation/pages/create_update_product.dart';
import 'package:products_management/injection.dart';

class ProductList extends HookWidget {
  ProductList({
    super.key,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Map<String, dynamic> productData = {
    "name": '',
    "prix": '',
    "tva": '',
  };

  @override
  Widget build(BuildContext context) {
    final refresh = useState<bool>(true);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'List des produits',
                    color: Colors.grey,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: blueGreen),
                      onPressed: () {
                        MyAlertDialog.showAlertDialog(
                            context: context,
                            child: CreateUpdateProduct(
                              refresh: refresh,
                            ));
                      },
                      child: const Text(
                        "Creation de produit",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<List<Product>>(
                future: getIt<MyDatabase>().getProducts(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('there is no product'),
                      );
                    } else {
                      return Expanded(
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 600,
                          columns: const [
                            DataColumn2(
                              label: Text("Id"),
                              // size: ColumnSize.,
                            ),
                            DataColumn2(
                              label: Text("Libelle"),
                            ),
                            DataColumn2(
                              label: Text("Description"),
                            ),
                            DataColumn2(
                              label: Text("TVA"),
                            ),
                            DataColumn2(
                              label: Text("Categorie"),
                            ),
                            DataColumn2(
                              label: Text("refrence"),
                            ),
                            DataColumn2(
                              label: Text("image"),
                            ),
                            DataColumn(
                              label: Text('Created At'),
                            ),
                            DataColumn(
                              label: Text('Actions'),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            snapshot.data!.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  CustomText(
                                    text: '${snapshot.data![index].id}',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].libelle,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].description ??
                                        'NoN',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].tva,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].categorie,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].refrence,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: snapshot.data![index].image ?? 'NoN',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text:
                                        '${snapshot.data![index].createdAt.day}-${snapshot.data![index].createdAt.month}-${snapshot.data![index].createdAt.year} ${snapshot.data![index].createdAt.hour}:${snapshot.data![index].createdAt.minute}',
                                  ),
                                ),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        MyAlertDialog.showAlertDialog(
                                          context: context,
                                          child: CreateUpdateProduct(
                                            categorie:
                                                snapshot.data![index].categorie,
                                            description: snapshot
                                                .data![index].description,
                                            libelle:
                                                snapshot.data![index].libelle,
                                            refrence:
                                                snapshot.data![index].refrence,
                                            id: snapshot.data![index].id,
                                            name: snapshot.data![index].libelle,
                                            prix: snapshot.data![index].prix,
                                            tva: snapshot.data![index].tva,
                                            refresh: refresh,
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        getIt<MyDatabase>().deleteProduct(
                                            snapshot.data![index].id);
                                        refresh.value = !refresh.value;
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_sharp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

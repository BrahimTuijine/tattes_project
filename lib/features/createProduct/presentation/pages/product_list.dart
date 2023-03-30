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
                      List<Product> reversed = snapshot.data!.reversed.toList();
                      return Expanded(
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          columns: const [
                            DataColumn2(
                              label: Text("Id"),
                              size: ColumnSize.M,
                            ),
                            DataColumn2(
                              label: Text(
                                "Libelle",
                              ),
                            ),
                            DataColumn2(
                              label: Text("Fournisser"),
                            ),
                            DataColumn2(
                              label: Text("Categorie"),
                            ),
                            DataColumn2(
                              size: ColumnSize.S,
                              label: Text("Nb piece"),
                            ),
                            DataColumn2(
                              label: Text("Prix"),
                            ),
                            DataColumn2(
                              label: Text("TVA"),
                            ),
                            DataColumn2(
                              label: Text("Prix or tax"),
                            ),
                            DataColumn2(
                              size: ColumnSize.L,
                              label: Text('Created At'),
                            ),
                            DataColumn2(
                              label: Text('Actions'),
                            ),
                          ],
                          rows: List<DataRow>.generate(
                            reversed.length,
                            (index) => DataRow(
                              cells: [
                                DataCell(
                                  CustomText(
                                    text: '${reversed[index].id}',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].libelle,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].fournisser,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].categorie,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].nbrePiece,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].prix,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].tva == '0.0'
                                        ? '0 %'
                                        : reversed[index].tva == '0.07'
                                            ? '7 %'
                                            : '19 %',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].prixOrTax,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text:
                                        '${reversed[index].createdAt.day}-${reversed[index].createdAt.month}-${reversed[index].createdAt.year} ${reversed[index].createdAt.hour}:${reversed[index].createdAt.minute}',
                                  ),
                                ),
                                DataCell(Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        MyAlertDialog.showAlertDialog(
                                          context: context,
                                          child: CreateUpdateProduct(
                                            product: reversed[index],
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
                                        getIt<MyDatabase>()
                                            .deleteProduct(reversed[index].id);
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

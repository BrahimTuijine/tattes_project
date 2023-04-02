import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/features/createSupplier/presentation/pages/create_update_supplier.dart';
import 'package:products_management/injection.dart';

class SupplierList extends HookWidget {
  const SupplierList({Key? key}) : super(key: key);

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
                    text: 'List des fournisseurs',
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
                            child: CreateUpdateSupplier(
                              refresh: refresh,
                            ));
                      },
                      child: const Text(
                        "Creation de fournisseur",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<List<Fournisser>>(
                future: getIt<MyDatabase>().getSuppliers(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Fournisser>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('there is no fournissuer'),
                      );
                    } else {
                      List<Fournisser> reversed =
                          snapshot.data!.reversed.toList();
                      return Expanded(
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          columns: const [
                            DataColumn2(
                              label: Text("Id"),
                            ),
                            DataColumn2(
                              label: Text("Name"),
                              size: ColumnSize.L,
                            ),
                            DataColumn(
                              label: Text('Phone'),
                            ),
                            DataColumn(
                              label: Text('Ville'),
                            ),
                            DataColumn(
                              label: Text('Rue'),
                            ),
                            DataColumn(
                              label: Text('Created At'),
                            ),
                            DataColumn(
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
                                    text: reversed[index].name,
                                  ),
                                ),
                                DataCell(
                                    CustomText(text: reversed[index].phone)),
                                DataCell(CustomText(
                                  text: reversed[index].ville,
                                )),
                                DataCell(
                                  CustomText(text: reversed[index].rue),
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
                                          child: CreateUpdateSupplier(
                                            createdAt:
                                                reversed[index].createdAt,
                                            id: reversed[index].id,
                                            name: reversed[index].name,
                                            rue: reversed[index].rue,
                                            phone: reversed[index].phone,
                                            ville: reversed[index].ville,
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
                                        getIt<MyDatabase>().deleteSuppliers(
                                            reversed[index].id);
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

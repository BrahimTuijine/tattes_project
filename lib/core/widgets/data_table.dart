import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:products_management/core/database/database.dart';

import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/widgets/custom_text.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends HookWidget {
  // final PageController controller;
  DataTable2SimpleDemo({
    Key? key,
    //  this.controller,
  }) : super(key: key);

  late MyDatabase myDatabase;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      myDatabase = MyDatabase();
      return () {
        myDatabase.close();
        print('my db closed');
      };
    }, const []);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Available clients ',
                color: Colors.grey,
                size: 20,
                weight: FontWeight.w600,
              ),
              FutureBuilder<List<Client>>(
                future: myDatabase.getClients(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Client>> snapshot) {
                  if (snapshot.data == []) {
                    return const Text('there is no client');
                  } else if (snapshot.hasData) {
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
                                  text: snapshot.data![index].name,
                                ),
                              ),
                              DataCell(CustomText(
                                  text: snapshot.data![index].phone)),
                              DataCell(Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(
                                    Icons.star,
                                    color: Colors.deepOrange,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: snapshot.data![index].ville,
                                  )
                                ],
                              )),
                              DataCell(
                                CustomText(text: snapshot.data![index].rue),
                              ),
                              DataCell(
                                CustomText(text: snapshot.data![index].createdAt.toString()),
                              ),
                              DataCell(
                                Container(
                                  decoration: BoxDecoration(
                                    color: light,
                                    borderRadius: BorderRadius.circular(20),
                                    border:
                                        Border.all(color: active, width: .5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child: CustomText(
                                    text: "Block",
                                    color: active.withOpacity(.7),
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          )),
    ));
  }
}

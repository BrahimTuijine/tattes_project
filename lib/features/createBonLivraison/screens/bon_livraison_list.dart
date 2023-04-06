import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/customer.dart';
import 'package:products_management/core/models/invoice.dart';
import 'package:products_management/core/models/supplier.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/utils/generate_pdf.dart';
import 'package:products_management/core/utils/pdf_api.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/core/widgets/dialog.dart';
import 'package:products_management/features/createBonLivraison/screens/create_update_bon_livraison.dart';
import 'package:products_management/injection.dart';

class BonLivraisonList extends HookWidget {
  const BonLivraisonList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final refresh = useState<bool>(true);
    return PageView(
      controller: controller,
      children: [
        Scaffold(
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
                        text: 'List des Bon de Livraison',
                        color: Colors.grey,
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blueGreen),
                          onPressed: () {
                            MyAlertDialog.showAlertDialog(
                                context: context,
                                child: CreateUpdateBonLivraison(
                                  refresh: refresh,
                                ));
                          },
                          child: const Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Creation de Bon de Livraison",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FutureBuilder<List<BonLivraison>>(
                    future: getIt<MyDatabase>().getBonLisvraison(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<BonLivraison>> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('there is no Bon de Livraison '),
                          );
                        } else {
                          List<BonLivraison> reversed =
                              snapshot.data!.reversed.toList();
                          return Expanded(
                            child: DataTable2(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              // minWidth: 600,
                              columns: const [
                                DataColumn2(
                                  label: Text("Id"),
                                  // size: ColumnSize.,
                                ),
                                DataColumn2(
                                  label: Text("clientName"),
                                  // size: ColumnSize.,
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
                                        text: reversed[index].clientName,
                                      ),
                                    ),
                                    DataCell(
                                      CustomText(
                                          text: DateFormat('yyyy-MM-dd kk:mm')
                                              .format(
                                                  reversed[index].createdAt)),
                                    ),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            MyAlertDialog.showAlertDialog(
                                              context: context,
                                              child: CreateUpdateBonLivraison(
                                                refresh: refresh,
                                                bonLivraison: reversed[index],
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
                                                .deleteBonLisvraison(
                                                    reversed[index].id);
                                            refresh.value = !refresh.value;
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline_sharp,
                                            color: Colors.red,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            final invoice = Invoice(
                                                customer: Customer(
                                                  address: "OUSSAMA BEN ZAID",
                                                  cin: "11432777",
                                                  name: "BRAHIM TUIJINE",
                                                  numTva: "FDJLFJD16516",
                                                ),
                                                supplier: Supplier(
                                                  name:
                                                      "STE MARMOURI GENERAL COMMERCE & DISTRIBUTION",
                                                  address:
                                                      "RUE DE L'ENVIRONNEMENT",
                                                  mf: "MF: 1228271P/P/M 000 EL ALIA",
                                                  phone:
                                                      "54 673 296 - 52 673 299 - 56 452 383- 56 452 015",
                                                  email:
                                                      "ste.marmouri@gmail.com",
                                                ),
                                                info: InvoiceInfo(
                                                  description:
                                                      "description ...",
                                                  number:
                                                      "${DateTime.now().year}-9999",
                                                  date: DateTime.now(),
                                                  dueDate: DateTime.now().add(
                                                      const Duration(days: 7)),
                                                ),
                                                items: [
                                                  InvoiceItem(
                                                    description: 'Coffee',
                                                    date: DateTime.now(),
                                                    quantity: 3,
                                                    vat: 0.19,
                                                    unitPrice: 5.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Water',
                                                    date: DateTime.now(),
                                                    quantity: 8,
                                                    vat: 0.19,
                                                    unitPrice: 0.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Orange',
                                                    date: DateTime.now(),
                                                    quantity: 3,
                                                    vat: 0.19,
                                                    unitPrice: 2.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Apple',
                                                    date: DateTime.now(),
                                                    quantity: 8,
                                                    vat: 0.19,
                                                    unitPrice: 3.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Mango',
                                                    date: DateTime.now(),
                                                    quantity: 1,
                                                    vat: 0.19,
                                                    unitPrice: 1.59,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Blue Berries',
                                                    date: DateTime.now(),
                                                    quantity: 5,
                                                    vat: 0.19,
                                                    unitPrice: 0.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Lemon',
                                                    date: DateTime.now(),
                                                    quantity: 4,
                                                    vat: 0.19,
                                                    unitPrice: 1.29,
                                                  ),
                                                ]);
                                            final pdfFile =
                                                await PdfInvoiceApi.generate(
                                                    invoice);
                                            PdfApi.openFile(pdfFile);
                                          },
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.green,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            final invoice = Invoice(
                                                customer: Customer(
                                                  address: "OUSSAMA BEN ZAID",
                                                  cin: "11432777",
                                                  name: "BRAHIM TUIJINE",
                                                  numTva: "FDJLFJD16516",
                                                ),
                                                supplier: Supplier(
                                                  name:
                                                      "STE MARMOURI GENERAL COMMERCE & DISTRIBUTION",
                                                  address:
                                                      "RUE DE L'ENVIRONNEMENT",
                                                  mf: "MF: 1228271P/P/M 000 EL ALIA",
                                                  phone:
                                                      "54 673 296 - 52 673 299 - 56 452 383- 56 452 015",
                                                  email:
                                                      "ste.marmouri@gmail.com",
                                                ),
                                                info: InvoiceInfo(
                                                  description:
                                                      "description ...",
                                                  number:
                                                      "${DateTime.now().year}-9999",
                                                  date: DateTime.now(),
                                                  dueDate: DateTime.now().add(
                                                      const Duration(days: 7)),
                                                ),
                                                items: [
                                                  InvoiceItem(
                                                    description: 'Coffee',
                                                    date: DateTime.now(),
                                                    quantity: 3,
                                                    vat: 0.19,
                                                    unitPrice: 5.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Water',
                                                    date: DateTime.now(),
                                                    quantity: 8,
                                                    vat: 0.19,
                                                    unitPrice: 0.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Orange',
                                                    date: DateTime.now(),
                                                    quantity: 3,
                                                    vat: 0.19,
                                                    unitPrice: 2.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Apple',
                                                    date: DateTime.now(),
                                                    quantity: 8,
                                                    vat: 0.19,
                                                    unitPrice: 3.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Mango',
                                                    date: DateTime.now(),
                                                    quantity: 1,
                                                    vat: 0.19,
                                                    unitPrice: 1.59,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Blue Berries',
                                                    date: DateTime.now(),
                                                    quantity: 5,
                                                    vat: 0.19,
                                                    unitPrice: 0.99,
                                                  ),
                                                  InvoiceItem(
                                                    description: 'Lemon',
                                                    date: DateTime.now(),
                                                    quantity: 4,
                                                    vat: 0.19,
                                                    unitPrice: 1.29,
                                                  ),
                                                ]);
                                            final pdfFile =
                                                await PdfInvoiceApi.generate(
                                                    invoice);
                                            // ? print pdf
                                            PdfApi.printPdf(pdfFile);
                                          },
                                          icon: const Icon(
                                            Icons.print,
                                            color: Colors.black,
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
        ),
      ],
    );
  }
}

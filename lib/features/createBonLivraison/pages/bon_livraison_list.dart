import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/bon_livraison.dart';
import 'package:products_management/core/strings/colors.dart';
import 'package:products_management/core/utils/pdf_bonlivraison.dart';
import 'package:products_management/core/utils/pdf_api.dart';
import 'package:products_management/core/utils/pdf_facture.dart';
import 'package:products_management/core/widgets/custom_text.dart';
import 'package:products_management/injection.dart';

class BonLivraisonList extends HookWidget {
  const BonLivraisonList({
    super.key,
  });

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
                children: const [
                  CustomText(
                    text: 'List des Bon de Livraison',
                    color: Colors.grey,
                    size: 20,
                    weight: FontWeight.w600,
                  ),
                  // SizedBox(
                  //   width: 200,
                  //   height: 40,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: blueGreen),
                  //     onPressed: () {
                  //       MyAlertDialog.showAlertDialog(
                  //         context: context,
                  //         child: CreateUpdateBonLivraison(),
                  //       );
                  //     },
                  //     child: const Center(
                  //       child: Text(
                  //         textAlign: TextAlign.center,
                  //         "Creation de Bon de Livraison",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<List<FactureWithClient>>(
                future: getIt<MyDatabase>().getBonLivrasonData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<FactureWithClient>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('there is no Bon de Livraison '),
                      );
                    } else {
                      List<FactureWithClient> reversed =
                          snapshot.data!.reversed.toList();
                      // print(snapshot.data);
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
                                    text: '${reversed[index].factureId}',
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: reversed[index].client.name,
                                  ),
                                ),
                                DataCell(
                                  CustomText(
                                    text: DateFormat('yyyy-MM-dd kk:mm')
                                        .format(reversed[index].createdAt),
                                  ),
                                ),
                                DataCell(Row(
                                  children: [
                                    // IconButton(
                                    //   onPressed: () {
                                    //     MyAlertDialog.showAlertDialog(
                                    //       context: context,
                                    //       child: CreateUpdateBonLivraison(
                                    //         bonLivraison: reversed[index],
                                    //       ),
                                    //     );
                                    //   },
                                    //   icon: const Icon(
                                    //     Icons.edit,
                                    //     color: Colors.blue,
                                    //   ),
                                    // ),
                                    IconButton(
                                      onPressed: () async {
                                        await getIt<MyDatabase>()
                                            .deleteBonLisvraison(
                                                reversed[index].factureId);

                                        refresh.value = !refresh.value;
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_sharp,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final productList =
                                            await getIt<MyDatabase>()
                                                .getBonLivrisonFactureData(
                                          reversed[index].factureId,
                                        );

                                        // ? generate the pdf
                                        final pdfFile =
                                            await BonLivraisonPdf.generate(
                                                client: reversed[index].client,
                                                productList: productList,
                                                bonLivraisonId: reversed[index]
                                                    .factureId,
                                                createdAt:
                                                    reversed[index].createdAt);
                                        PdfApi.openFile(pdfFile);
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final productList =
                                            await getIt<MyDatabase>()
                                                .getBonLivrisonFactureData(
                                          reversed[index].factureId,
                                        );

                                        // ? generate the pdf
                                        final pdfFile =
                                            await BonLivraisonPdf.generate(
                                                client: reversed[index].client,
                                                productList: productList,
                                                bonLivraisonId: reversed[index]
                                                    .factureId,
                                                createdAt:
                                                    reversed[index].createdAt);
                                        // ? print pdf
                                        PdfApi.printPdf(pdfFile);
                                      },
                                      icon: const Icon(
                                        Icons.print,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final productList =
                                            await getIt<MyDatabase>()
                                                .getBonLivrisonFactureData(
                                          reversed[index].factureId,
                                        );

                                        // ? generate the pdf
                                        final pdfFile =
                                            await FacturePdf.generate(
                                                client: reversed[index].client,
                                                productList: productList,
                                                bonLivraisonId: reversed[index]
                                                    .factureId,
                                                createdAt:
                                                    reversed[index].createdAt);
                                        PdfApi.openFile(pdfFile);
                                      },
                                      icon: const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        final productList =
                                            await getIt<MyDatabase>()
                                                .getBonLivrisonFactureData(
                                          reversed[index].factureId,
                                        );

                                        // ? generate the pdf
                                        final pdfFile =
                                            await FacturePdf.generate(
                                                client: reversed[index].client,
                                                productList: productList,
                                                bonLivraisonId: reversed[index]
                                                    .factureId,
                                                createdAt:
                                                    reversed[index].createdAt);
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
    );
  }
}

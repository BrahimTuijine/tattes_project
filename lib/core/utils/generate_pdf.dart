import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:products_management/core/models/invoice.dart';
import 'package:products_management/core/utils/pdf_api.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: ((context) => [
              buildTitle(invoice),
              buildTable(invoice),
              Divider(),
              buildTotal(invoice)
            ]),
      ),
    );

    return PdfApi.saveDocument(name: 'bon_de_livraison.pdf', pdf: pdf);
  }

  static Widget buildTotal(Invoice invoice) {
    final double totalTTC = invoice.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((value, element) => value + element);

    return Container(
      alignment: Alignment.topRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                    title: 'Total TTC',
                    value: totalTTC.toString(),
                    unite: true),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildText(
      {required String title,
      required String value,
      double width = double.infinity,
      TextStyle? titleStyle,
      bool unite = false}) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
        child: Row(
      children: [
        Expanded(
          child: Text(title, style: style),
        ),
        Text(value, style: unite ? style : null),
      ],
    ));
  }

  static Widget buildTable(Invoice invoice) {
    final List<String> headers = [
      'Ln',
      'Désignation',
      'Nbr Col',
      'Qté',
      'P.U. TTC',
      'Total TTC',
    ];

    final List<List<dynamic>> data = invoice.items.map((item) {
      final double total = item.unitPrice * item.quantity * (1 + item.vat);

      return [
        '1',
        item.description,
        '1',
        item.quantity,
        item.unitPrice,
        total.toStringAsFixed(2),
      ];
    }).toList();

    return Table.fromTextArray(
      headerAlignment: Alignment.topLeft,
      data: data,
      headers: headers,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
    );
  }

  static Widget buildTitle(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invoice',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(invoice.info.description),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );
}

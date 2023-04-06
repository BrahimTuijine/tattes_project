import 'dart:io';

import 'package:intl/intl.dart';
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
              buildHeader(invoice),
              SizedBox(height: 2 * PdfPageFormat.cm),
              buildTitle(invoice),
              buildTable(invoice),
              Divider(),
              buildTotal(invoice),
              buildFooter(invoice)
            ]),
      ),
    );

    return PdfApi.saveDocument(name: 'bon_de_livraison.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice),
              SizedBox(
                height: 50,
                width: 50,
                child: FlutterLogo(),
              ),
            ],
          ),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCustomerAddress(invoice),
              buildInvoiceInfo(invoice)
            ],
          )
        ],
      );
  static buildSupplierAddress(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(invoice.supplier.name,
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(invoice.supplier.address),
        ],
      );

  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: invoice.supplier.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Email', value: invoice.supplier.email),
        ],
      );

  static Widget buildSimpleText(
      {required String title, required String value}) {
    final style = TextStyle(fontWeight: FontWeight.bold);
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
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
                  title: 'Total HT',
                  value: totalTTC.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Total TVA',
                  value: 80.20.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Timbre fiscal',
                  value: 1000.toString(),
                  unite: true,
                ),
                Divider(),
                buildText(
                  title: 'Total TTC',
                  value: 1000.toString(),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: .5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
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

  static Widget buildCustomerAddress(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            invoice.customer.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(invoice.customer.address),
        ],
      );

  static Widget buildInvoiceInfo(Invoice invoice) {
    final List<String> title = <String>[
      'invoice Number',
      'invoice Date',
      'invoice Terms',
      'Date échéance',
    ];
    final List<String> data = <String>[
      invoice.info.number,
      DateFormat('yyyy-MM-dd kk:mm').format(invoice.info.date),
      invoice.info.description,
      DateFormat('yyyy-MM-dd kk:mm').format(invoice.info.dueDate),
    ];

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            title.length,
            (index) => Text(title[index],
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(width: 3 * PdfPageFormat.cm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            title.length,
            (index) => Text(data[index]),
          ),
        ),
      ],
    );
  }
}

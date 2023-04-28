import 'dart:io';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:products_management/core/database/database.dart';
import 'package:products_management/core/models/customer.dart';
import 'package:products_management/core/models/invoice.dart';
import 'package:products_management/core/models/supplier.dart';
import 'package:products_management/core/utils/pdf_api.dart';

class BonLivraisonPdf {
  static Future<File> generate({
    required List<PdfData> productList,
    required Client client,
    required int bonLivraisonId,
    required DateTime createdAt,
  }) async {
    // !bon de livraison info to generate the pdf
    final Invoice invoice = Invoice(
      customer: Customer(
        address: client.rue,
        cin: client.cin,
        name: client.name,
        numTva: client.numTva,
        phone: client.phone,
      ),
      id: bonLivraisonId,
      info: InvoiceInfo(
        date: createdAt,
        number: '',
      ),
      items: List.generate(
          productList.length,
          (index) => InvoiceItem(
                productName: productList[index].product.libelle,
                quantity: productList[index].product.nbrePiece,
                unitPrice: productList[index].newPrice,
                nbrCol: productList[index].nbrCol,
                index: index,
              )),
      supplier: Supplier(),
    );
    final pdf = Document();

    pdf.addPage(
      MultiPage(
        build: ((context) => [
              buildHeader(invoice),
              SizedBox(height: 1 * PdfPageFormat.cm),
              buildTitle(invoice),
              SizedBox(height: 1 * PdfPageFormat.cm),
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
          buildInvoiceInfo(invoice)
        ],
      );
  static buildSupplierAddress(Invoice invoice) => Text(
        ' BON DE LIVRAISON N°${invoice.id}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
        .map((item) => item.unitPrice * item.quantity * item.nbrCol)
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
      final double total = item.unitPrice * item.quantity * item.nbrCol;

      return [
        item.index,
        item.productName,
        item.nbrCol,
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

  static Widget buildTitle(Invoice invoice) => Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              constraints: const BoxConstraints(
                minHeight: 120,
              ),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              padding: const EdgeInsets.all(8),
              child: Text('''
${invoice.supplier.name}
${invoice.supplier.address}
MF: ${invoice.supplier.mf}
Téléphone: ${invoice.supplier.phone}
Email: ${invoice.supplier.email}
''')),
          Container(
              constraints: const BoxConstraints(
                minHeight: 120,
                minWidth: 235,
                maxWidth: 235,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text('''
Nom : ${invoice.customer.name}
Rue : ${invoice.customer.address} 
CIN: ${invoice.customer.cin}  
Téléphone: ${invoice.customer.phone}
''')),
        ],
      );

  static Widget buildInvoiceInfo(Invoice invoice) {
    final List<String> title = <String>[
      'invoice Number',
      'invoice Date',
      'Date échéance',
    ];
    final List<String> data = <String>[
      invoice.info.number,
      DateFormat('yyyy-MM-dd kk:mm').format(invoice.info.date),
      invoice.info.dueDate == null
          ? ""
          : DateFormat('yyyy-MM-dd kk:mm').format(invoice.info.dueDate!),
    ];

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            title.length,
            (index) => Text(title[index],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ),
        SizedBox(width: 3 * PdfPageFormat.cm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            title.length,
            (index) => Text(
              data[index],
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}

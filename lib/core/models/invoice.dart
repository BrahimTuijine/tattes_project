// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products_management/core/models/customer.dart';
import 'package:products_management/core/models/supplier.dart';

class Invoice {
  final int id;
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;

  const Invoice({
    required this.id,
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String number;
  final DateTime date;
  final DateTime? dueDate;

  const InvoiceInfo({
    required this.number,
    required this.date,
    this.dueDate,
  });
}

class InvoiceItem {
  final String productName;
  final int nbrCol;
  final int quantity;
  final int unitPrice;
  final int index;

  const InvoiceItem({
    required this.productName,
    required this.nbrCol,
    required this.quantity,
    required this.unitPrice,
    required this.index,
  });
}

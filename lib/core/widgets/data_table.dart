import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:products_management/core/strings/colors.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo({super.key});

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text("Name"),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('Location'),
                      ),
                      DataColumn(
                        label: Text('Rating'),
                      ),
                      DataColumn(
                        label: Text('Action'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                        15,
                        (index) => DataRow(cells: [
                              const DataCell(CustomText(text: "Santos Enoque")),
                              const DataCell(
                                  CustomText(text: "New yourk city")),
                              DataCell(Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepOrange,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                    text: "4.5",
                                  )
                                ],
                              )),
                              DataCell(Container(
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
                                  ))),
                            ]))),
              ),
            ],
          )),
    ));
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText(
      {super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}

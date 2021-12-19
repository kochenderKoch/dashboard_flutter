import 'package:dashboard_flutter/model/timecheck_model.dart';
import 'package:dashboard_flutter/provider/table_provider.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableView extends StatefulWidget {
  const TableView({Key? key}) : super(key: key);

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tableProvider = Provider.of<TableProvider>(context);
    List<TimecheckModel> data = Provider.of<List<TimecheckModel>>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: data.isEmpty
                  ? const Text("Nothing to show.")
                  : DataTable(
                      columns: _buildTableHeader(context, tableProvider, data),
                      rows: _buildTableContent(context, tableProvider, data)!,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

List<DataColumn> _buildTableHeader(BuildContext context,
    TableProvider tableProvider, List<TimecheckModel> data) {
  final firstElement = data.first;

  List<DataColumn> _cols = [];

  for (var key in firstElement.toMap().keys) {
    _cols.add(DataColumn(
      label: Text(
        key,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ));
  }

  return _cols;
}

List<DataRow>? _buildTableContent(BuildContext context,
    TableProvider tableProvider, List<TimecheckModel> data) {
  List<DataRow> _rows = [];
  final themeProvider = Provider.of<ThemeProvider>(context);

  for (var item in data) {
    List<DataCell> _currentCells = [];
    for (var value in item.toMap().values) {
      _currentCells.add(DataCell(Text(
        value,
        style: TextStyle(color: themeProvider.getTheme().colorScheme.onSurface),
      )));
    }

    _rows.add(DataRow(
        cells: _currentCells,
        color: MaterialStateColor.resolveWith((states) {
          switch (item.status) {
            case "OK":
              return themeProvider.successColor;

            case "ERROR":
              return themeProvider.errorColor;

            case "WARNING":
              return themeProvider.warningColor;

            default:
              return themeProvider.elseColor;
          }
        })));
  }
  return _rows;
}

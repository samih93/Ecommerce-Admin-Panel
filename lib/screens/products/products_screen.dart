import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/models/prdouct.dart';
import 'package:ecommerce_admin_panel/screens/products/components/product_data_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = <Product>[];
  late ProductDataSource productDataSource;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getProductData().then((value) {});
    });
  }

  Future<void> getProductData() async {
    context.read<ProductController>()..getAllorders();
  }

  // final DataGridController _dataGridController = DataGridController();

  @override
  Widget build(BuildContext context) {
    ProductController productController = Provider.of(context);
    // productDataSource =
    //     ProductDataSource(context, productController.list_of_product);
    return productController.isloadingGetProduct == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              // Container(
              //   padding: EdgeInsets.all(3),
              //   height: MediaQuery.of(context).size.height * .6,
              //   child: SfDataGrid(
              //     onQueryRowHeight: (details) {
              //       // Set the row height as 70.0 to the column header row.
              //       return details.rowIndex == 0 ? 70.0 : 49.0;
              //     },
              //     allowEditing: true,
              //     allowSorting: true,
              //     selectionMode: SelectionMode.single,
              //     navigationMode: GridNavigationMode.cell,
              //     source: productDataSource,
              //     columnWidthMode: ColumnWidthMode.fill,
              //     columns: getColumns(),
              //   ),
              // ),
            ],
          );
  }

  getColumns() {
    return <GridColumn>[
      GridColumn(
          allowSorting: false,
          columnName: 'id',
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'ID',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'name',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(
                'Name',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'price',
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(
                'Price',
                overflow: TextOverflow.ellipsis,
              ))),
    ];
  }
}

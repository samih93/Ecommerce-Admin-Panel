import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/models/student.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class RecentStudent extends StatelessWidget {
  final listofstudent;
  const RecentStudent({Key? key, this.listofstudent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Recent Transactions",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(),
              OutlinedButton(
                  onPressed: () {
                    // context.read<StudentController>()..getallStudent();
                  },
                  child: Text(
                    "refresh",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              columns: [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Age"),
                ),
              ],
              rows: List.generate(
                listofstudent.length,
                (index) => recentFileDataRow(listofstudent[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Student student) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/menu_profile.svg',
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(student.name!),
            ),
          ],
        ),
      ),
      DataCell(Text(student.age.toString())),
    ],
  );
}

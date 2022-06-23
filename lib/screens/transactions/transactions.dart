import 'package:ecommerce_admin_panel/controllers/studentController.dart';
import 'package:ecommerce_admin_panel/screens/transactions/components/RecentStudent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  // void initState() {
  //   // TODO: implement initState
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _loadData().then((value) => null);
  //   });

  //   super.initState();
  // }

  // Future<void> _loadData() async {
  //   context.read<StudentController>()..getallStudent();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Consumer<StudentController>(
        builder: (context, studentcontroller, child) => RecentStudent(
          listofstudent: studentcontroller.list_of_student,
        ),
      ),
    ));
  }
}

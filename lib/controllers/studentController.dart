import 'package:ecommerce_admin_panel/models/student.dart';
import 'package:flutter/cupertino.dart';

class StudentController extends ChangeNotifier {
  //Get all student
  bool isloadingGetStudent = false;
  List<Student> list_of_student = [];
  List<Student> original_list_of_Student = [];

  // Future<void> getallStudent() async {
  //   list_of_student = [];
  //   isloadingGetStudent = true;
  //   notifyListeners();
  //   DioHelper.dio!.get("students").then((value) {
  //     value.data.forEach((element) {
  //       list_of_student.add((Student.fromJson(element)));
  //     });

  //     original_list_of_Student = list_of_student;
  //     isloadingGetStudent = false;

  //     // list_of_student.forEach((element) {
  //     //   print(element.toJson());
  //     // });
  //     notifyListeners();
  //   });
  // }

// search for a student
  // bool isloadingSearchStudent = false;

  // Future<void> searchStudent(String name) async {
  //   list_of_student = [];

  //   if (name.toString().trim() != "") {
  //     isloadingSearchStudent = true;
  //     notifyListeners();
  //     DioHelper.dio!.get("students/search",
  //         queryParameters: {"name": '$name'}).then((value) {
  //       value.data.forEach((element) {
  //         print(element);
  //         list_of_student.add((Student.fromJson(element)));
  //       });

  //       isloadingSearchStudent = false;

  //       notifyListeners();
  //     });
  //   } else {
  //     list_of_student = original_list_of_Student;
  //     notifyListeners();
  //   }
  // }
}

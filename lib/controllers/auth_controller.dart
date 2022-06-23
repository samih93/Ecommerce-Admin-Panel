import 'package:ecommerce_admin_panel/models/UserModel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  // login with email and password
  bool isloadingSignIn = false;
  String errorMessage = "";

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    UserModel? userModel;
    isloadingSignIn = true;
    notifyListeners();
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        userModel = UserModel(
            email: value.user?.email,
            name: value.user?.displayName,
            pic: '',
            userId: value.user?.uid);
        isloadingSignIn = false;
        notifyListeners();

        // _getCurrentUser(user.user.uid);
      }); // .then((value) => print(value));
      //Get.offAll(() => EcommerceLayout(), binding: HomeViewBinding());
    } catch (e) {
      isloadingSignIn = false;

      errorMessage = e.toString();
      notifyListeners();
      print(e.toString());
    }
    return userModel;
  }

  Future SignOut() async {
    await FirebaseAuth.instance.signOut();
    currentuserModel = null;
  }
}

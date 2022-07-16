// ignore_for_file: unused_local_variable, prefer_const_constructors, unused_catch_clause, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_app/models/user_model.dart';
import 'package:commerce_app/routes/routes.dart';
import 'package:commerce_app/utils/my_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = true;
  bool isCheckBox = false;
  bool isCheckBoxLogin = false;
  bool? authStorage;
  var displayUserName = '';
  var displayUserPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  GetStorage authBox = GetStorage();
  var googleUser = GoogleSignInAccount;
 


  

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void signUpCheckBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signInCheckBox() {
    isCheckBoxLogin = !isCheckBoxLogin;
    update();
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        authBox.write('uId', value.user!.uid);

        // await createUserDate(email: email, name: name, uId: value.user!.uid);
        // getUserData();
        update();
        Get.offNamed(Routes.layoutScreen);
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar(error.code.replaceAll('-', ' ').toString(),
          error.message!.replaceAll('-', ' ').toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      update();
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      update();
    }
  }

  void signIn({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        authBox.write('uId', value.user!.uid);

        if (rememberMe == true) {
          authStorage = true;
          authBox.write('auth', authStorage);
        }
      });
      update();
      Get.offNamed(Routes.layoutScreen);
    } on FirebaseAuthException catch (error) {
      Get.snackbar(error.code.replaceAll('-', ' ').toString(),
          error.message!.replaceAll('-', ' ').toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Error!', error.message!.replaceAll('-', ' ').toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error!', e.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      Get.offNamed(Routes.layoutScreen);
      update();
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      authBox.remove('auth');
      update();
      Get.offNamed(Routes.loginScreen);
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          animationDuration: Duration(seconds: 5),
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future<void> createUserDate({
  //   required String uId,
  //   required String name,
  //   required String email,
  // }) async {
  //   UserModel model = UserModel(name: name, email: email);

  //   fireStore
  //       .collection('users')
  //       .doc(uId)
  //       .set(model.toMap())
  //       .catchError((error) {
  //     Get.snackbar('Error!', error.toString(),
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         animationDuration: Duration(seconds: 5),
  //         borderRadius: 10,
  //         snackPosition: SnackPosition.BOTTOM);
  //     update();
  //   });
  //   update();
  // }

  // void getUserData()  {
  //    fireStore.collection('users').doc(uId).get().then((value) {
  //     userModel = UserModel.fromJson(value.data()!);
  //   }).catchError((error) {
  //     Get.snackbar('Error!', error.toString(),
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         animationDuration: Duration(seconds: 5),
  //         borderRadius: 10,
  //         snackPosition: SnackPosition.BOTTOM);
  //   });
  //   update();
  // }
}

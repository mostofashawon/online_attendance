import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubmitAttendanceController extends GetxController {
  //TODO: Implement SubmitAttendanceController

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController, idController;
  var userName = '';
  var userId = '';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    idController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userNameController.dispose();
    idController.dispose();
  }
  void increment() => count.value++;

  String? validateUserName(String value) {
    if (value.length < 1 ) {
      return "This field is required";
    }
    return null;
  }

  String? validateID(String value) {
    if (value.length < 1) {
      return "This field is required";
    }
    return null;
  }

  Future<void> submitAttendanceInfo() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else{
      // loginFormKey.currentState!.save();
      print("feild fill up");
    }
  }
}

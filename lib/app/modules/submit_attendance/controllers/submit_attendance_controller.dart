import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../providers/attendance_provider.dart';

class SubmitAttendanceController extends GetxController {
  //TODO: Implement SubmitAttendanceController

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController userNameController, idController;
  var userName = '';
  var userId = '';

  Random random = new Random();
  late int requestId;
  var latitude = ''.obs;
  var longitude = ''.obs;
  late StreamSubscription<Position> streamSubscription;

  final count = 0.obs;

  var isLoading = true.obs;
  var networkResponse = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    idController = TextEditingController();
    requestId = random.nextInt(100);
    getLocation();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userNameController.dispose();
    idController.dispose();
    streamSubscription.cancel();
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
      loginFormKey.currentState!.save();
      getLocation();
      storeAddress();
    }
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          latitude.value = position.latitude.toString();
          longitude.value = position.longitude.toString();
        });
  }

  Future<dynamic> storeAddress() async {
    try{
      isLoading(true);
      var response = await AttendanceProvider().postAttendance(
          userName, userId, latitude.toString(), longitude.toString(), requestId);
      if ( response!= null && response == "Test data") {
          networkResponse.value = response.toString();
           isLoading(false);
           return true;
         ;
      }
    }
    catch(e){
      print(e.toString());
    }
  }
}

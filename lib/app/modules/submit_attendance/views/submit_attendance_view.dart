import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/submit_attendance_controller.dart';

class SubmitAttendanceView extends GetView<SubmitAttendanceController> {

  SubmitAttendanceController controller = Get.put(SubmitAttendanceController());
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenHeight * 0.019,
                right: screenHeight * 0.019,
                top: screenHeight * 0.019),
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.090,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey
                      ]
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        offset: Offset(0.7, 0.3))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Submit Attendance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.15,),
          Obx(() => Material(
            color: Colors.transparent,
            child: Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.019,
                        right: screenHeight * 0.019
                    ),
                    child: TextFormField(
                      cursorColor: Colors.green,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.blueGrey,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      controller: controller.userNameController,
                      validator: (value) {
                        return controller.validateUserName(value!);
                      },
                      onSaved: (value) {
                        controller.userName = value!;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.045,),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.019,
                        right: screenHeight * 0.019
                    ),
                    child: TextFormField(
                      cursorColor: Colors.blueGrey,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'User Id',
                        labelStyle: TextStyle(color: Colors.blueGrey,),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      controller: controller.idController,
                      validator: (value) {
                        return controller.validateID(value!);
                      },
                      onSaved: (value) {
                        controller.userId = value!;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.040,),
                  Center(
                    child:ElevatedButton(
                        onPressed: () async {
                          await controller.submitAttendanceInfo();
                          if( await controller.storeAddress() == true){
                            Get.snackbar("Submitted",
                                'Your Attendance has been Submitted',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Visibility(
                    visible: false,
                      child: Text(controller.storeAddress().toString()))
                ],
              ),
            ),
          ))

        ],
      )
    );
  }
}

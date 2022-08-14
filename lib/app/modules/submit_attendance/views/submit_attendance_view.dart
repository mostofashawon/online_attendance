import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/submit_attendance_controller.dart';

class SubmitAttendanceView extends GetView<SubmitAttendanceController> {
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
          SizedBox(height: screenHeight * 0.020,),

        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:online_attendance/app/modules/submit_attendance/views/submit_attendance_view.dart';
import 'package:online_attendance/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  HomeController controller = Get.put(HomeController());
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
            Text('List of Store',
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
      SizedBox(height: screenHeight * 0.025,),
      Obx(() {
        if(controller.isLoading.value == true) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blueGrey,
            ),
          );
        }
        else return  Expanded(child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: screenHeight * 0.019,
                  right: screenHeight * 0.019,
                ),
                child: GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.SUBMIT_ATTENDANCE);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 3.0,
                    shadowColor: Colors.grey,
                    child: Container(
                      height: screenHeight * 0.30,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.025,
                                    top: screenHeight * 0.025
                                ),
                                child: Text('Store Id :',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.018
                                  ),),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right : screenHeight * 0.12,
                                    top: screenHeight * 0.025
                                ),
                                child: Container(
                                  width: screenHeight * 0.10,
                                  child: Text(controller.storeList.value.data![index].id.toString(),
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.018,
                                        color: Colors.grey
                                    ),),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.025,
                                    top: screenHeight * 0.015
                                ),
                                child: Text('Store Name :',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.018
                                  ),),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right : screenHeight * 0.12,
                                    top: screenHeight * 0.015
                                ),
                                child: Container(
                                  width: screenHeight * 0.10,
                                  child: Text(controller.storeList.value.data![index].name.toString(),
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.018,
                                        color: Colors.grey
                                    ),),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.025
                                ),
                                child: Text('Store Address :',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.018
                                  ),),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right : screenHeight * 0.12,
                                    top: screenHeight * 0.025
                                ),
                                child: Container(
                                  width: screenHeight * 0.10,
                                  child: Text(controller.storeList.value.data![index].address.toString(),
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.018,
                                        color: Colors.grey
                                    ),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.015,)
                        ],
                      ),
                    ),

                  ),
                ),
              );
            }));
      })

      ],
      )
    );
  }
}

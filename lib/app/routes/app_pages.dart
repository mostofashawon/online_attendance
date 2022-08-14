import 'package:get/get.dart';

import 'package:online_attendance/app/modules/home/bindings/home_binding.dart';
import 'package:online_attendance/app/modules/home/views/home_view.dart';
import 'package:online_attendance/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:online_attendance/app/modules/submit_attendance/bindings/submit_attendance_binding.dart';
import 'package:online_attendance/app/modules/submit_attendance/views/submit_attendance_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUBMIT_ATTENDANCE,
      page: () => SubmitAttendanceView(),
      binding: SubmitAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
    ),
  ];
}

import 'package:get/get.dart';

class AttendanceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> postAttendance(
      String name,
      String uId,
      String latitude,
      String longitude,
      int request_id
      )async {

    var address = new Map();

    var response = await get(
        'http://128.199.215.102:4040/api/attendance?name={$name}&uid={$uId}&latitude={$latitude}&longitude={$longitude}&request_id={$request_id}',
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return true;
    } else {
      return null;
    }

  }
}

import 'package:get/get.dart';

import '../../../model/store.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Store?> getStoreList() async {


      var response = await get(
        'http://128.199.215.102:4040/api/stores'
      );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return Store.fromJson(jsonString);
      } else {
        return null;
      }
    }
}

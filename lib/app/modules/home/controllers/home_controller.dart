import 'package:get/get.dart';
import 'package:online_attendance/app/model/store.dart';
import 'package:online_attendance/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var isLoading = true.obs;

  var storeList = Store().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchStoreList();
  }


  Future<void> fetchStoreList() async {
    try{
      isLoading(true);
      var storeLists = await HomeProvider().getStoreList();
      if ( storeLists!= null ) {
        storeList.value = storeLists ;
        isLoading(false);
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

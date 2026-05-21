import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modul10_flutter_crud_api/app/data/post_model.dart';
import 'package:modul10_flutter_crud_api/services/post_api.dart';
import 'package:modul10_flutter_crud_api/widgets/loading.dart';

class AllPostController extends GetxController {
  PostListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;
  loadPost() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PostApi().loadPostAPI();
    update();
    stopLoading();
    if (posts?.status == 200) {
    } else if (posts!.status == 204) {
      print("Empty");
    } else if (posts!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }
}

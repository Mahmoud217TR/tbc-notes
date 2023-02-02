import 'package:get/get.dart';

class IconButtonController extends GetxController {
  RxBool obsecureText = true.obs;

  click() {
    obsecureText(!obsecureText.value);
  }
}

import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  final RxBool isAgreed = RxBool(false);
  final RxBool isAgreedEmpty = RxBool(false);

  void changeaAgreement(final bool value) {
    isAgreedEmpty.value = false;
    isAgreed.value = value;
  }

  void changeaAreementIsEmpty(final bool value) {
    isAgreedEmpty.value = value;
  }
}

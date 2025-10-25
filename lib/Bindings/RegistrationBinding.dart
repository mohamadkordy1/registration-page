import 'package:get/get.dart';
import 'package:registration_page/Controllers/RegistrationController.dart';


class Registrationbinding extends Bindings{
 
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
  
}
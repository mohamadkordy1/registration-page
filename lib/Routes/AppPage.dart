import 'package:get/route_manager.dart';
import 'package:registration_page/Bindings/RegistrationBinding.dart';
import 'package:registration_page/Routes/AppRoutes.dart';
import 'package:registration_page/Views/Registration.dart';
import 'package:registration_page/Bindings/LoginBinding.dart';
import 'package:registration_page/Views/Login.dart';
class Apppage {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.register,
      page: () => RegistrationPage(),
      binding: Registrationbinding(),
    ),
  GetPage(name: AppRoutes.login,
   page: () => LoginPage(),
   binding: LoginBinding(),
   ),

  ];
} 
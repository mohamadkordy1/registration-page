import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:registration_page/Core/Network/DioClient.dart';
import 'package:registration_page/Models/User.dart';

class RegistrationController extends GetxController {

TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

void Rigester(){
    User user = User(
      name: name.text,
      email: email.text,
      password: password.text,
      password_confirmation: password_confirmation.text,
    );
String requestBody = user.tojason();
print(requestBody);

var post=DioClient().getInstance().post(
      'http://chatbot.test/api/register',
      data: requestBody,
    );

    post.then((response) {
      print('Registration successful: ${response.data}');
    }).catchError((error) {
      print('Registration failed: $error');
    });






}



}
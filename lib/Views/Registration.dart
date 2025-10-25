import 'package:get/get.dart';
import 'package:registration_page/Routes/AppRoutes.dart';
import '../Controllers/RegistrationController.dart';
import 'package:flutter/material.dart';
 

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

final RegistrationController controller = Get.put(RegistrationController());

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
     TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator ??
              (value) =>
                  value == null || value.isEmpty ? 'Please enter your $label' : null,
          decoration: InputDecoration(
            labelText: 'Enter your $label',
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Create your account',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 28),
              _buildTextField(
                label: 'Full Name',
                controller: controller.name,
              ),
              _buildTextField(
                label: 'Email',
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
              ),
             
             
              _buildTextField(
                label: 'Password',
                controller: controller.password,
                obscureText: true,
              ),
              _buildTextField(
                label: 'confirm your Password',
                controller: controller.password_confirmation,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){

                  controller.Rigester();

                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {Get.toNamed(AppRoutes.login);},
                child: const Text(
                  'Already have an account? Sign in',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

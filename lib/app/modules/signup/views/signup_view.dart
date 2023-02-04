import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../helpers/validator.dart';
import '../../../wigets/input_form_with_icon.dart';
import '../../auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 48.0,
                  ),
                  InputFormWithIcon(
                    controller: controller.emailController,
                    iconPrefix: Icons.email,
                    labelText: 'Enter Email',
                    validator: ((value) => Validator.email(value)),
                    onChanged: ((value) => controller.onChange()),
                    onSaved: ((value) =>
                        controller.emailController.text = value!),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  InputFormWithIcon(
                    controller: controller.passwordController,
                    iconPrefix: Icons.password_rounded,
                    labelText: 'Enter Password',
                    validator: ((value) => Validator.password(value)),
                    onChanged: ((value) => controller.onChange()),
                    onSaved: ((value) =>
                        controller.passwordController.text = value!),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        AuthController.instance.login(
                            controller.emailController.text.trim(),
                            controller.passwordController.text.trim());
                      },
                      child: const Text('Sign Up'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

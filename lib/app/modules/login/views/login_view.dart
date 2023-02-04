import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tt151attendants/app/helpers/validator.dart';
import 'package:tt151attendants/app/modules/auth_controller.dart';
import 'package:tt151attendants/app/wigets/input_form_with_icon.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
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
                    isObscureText: true,
                    validator: ((value) => Validator.password(value)),
                    onChanged: ((value) => controller.onChange()),
                    onSaved: ((value) =>
                        controller.passwordController.text = value!),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  log("formkey invalid!");
                                }
                                AuthController.instance.login(
                                    controller.emailController.text.trim(),
                                    controller.passwordController.text.trim());
                              },
                              child: const Text('Sign In')),
                        ),
                        const SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  log("formkey invalid!");
                                }
                                AuthController.instance.register(
                                    controller.emailController.text.trim(),
                                    controller.passwordController.text.trim());
                              },
                              child: const Text('Sign Up')),
                        ),
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

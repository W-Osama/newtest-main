// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtest/bloc/login_bloc.dart';
import 'package:newtest/login/email_field.dart';
import 'package:newtest/login/login_button.dart';
import 'package:newtest/login/password_field.dart';
import 'package:newtest/login/text_sign_up.dart';
import 'package:newtest/login/username_field.dart';

class FormWidget extends StatelessWidget {
  bool isChecked = true;
  FormWidget({Key? key}) : super(key: key);

  final dynamic _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              const UsernameField(),
              const SizedBox(height: 15),
              const EmailField(),
              const SizedBox(height: 15),
              const PasswordField(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: const Color.fromARGB(255, 22, 96, 160),
                    checkColor: Colors.white,
                    tristate: true,
                    value: isChecked,
                    onChanged: (value) {
                      BlocProvider.of<LoginBloc>(context);
                    },
                  ),
                  const Text(
                    'Remember',
                    textAlign: TextAlign.center,
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
              LoginButton(formKey: _formKey),
              const SizedBox(height: 50),
              const TextSignUp(
                textone: " Don't have an account? ",
                texttwo: "Sign up ",
              ),
            ],
          ),
        ));
  }
}

void setState(Null Function() param0) {}

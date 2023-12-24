import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtest/bloc/login_bloc.dart';
import 'package:newtest/bloc/login_state.dart';
import 'package:newtest/form/form_submissions_status.dart';
import 'package:newtest/form/form_widget.dart';
import 'package:newtest/login/body_login.dart';
import 'package:newtest/login/title_login.dart';
import 'package:newtest/repository/login_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: const Text(
            'WOSUL',
          ),
          centerTitle: true),
      backgroundColor: Colors.grey.shade200,
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.formStatus != current.formStatus,
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleLogin(),
                    const BodyLogin(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 80,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                                spreadRadius: 0,
                              ),
                            ]),
                        child: FormWidget()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids/features/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  var loginKey = GlobalKey<FormState>(debugLabel: "loginKey");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          height: 284,
          width: 284,
          left: -142,
          top: -142,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(284),
              color: Color(0x80FFC801),
            ),
            child: Align(
              alignment: Alignment(
                0.5,
                0.7,
              ),
            ),
          ),
        ),
        Positioned(
            height: 284,
            width: 284,
            bottom: -142,
            right: -142,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(284),
                  color: Color(0x80FFC801)),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "LOG IN",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF263060),
                      fontSize: 20,
                    ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(flex: 2, child: Image.asset("assets/logo.png")),
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "User name",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF263060),
                                fontSize: 15,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: TextFormField(
                            //on change
                            onChanged: (value) {},
                            //validator
                            validator: (value) {
                              return (value ?? "").isEmpty
                                  ? "Please, enter your username"
                                  : null;
                            },
                            cursorColor: Colors.black,
                            //decoration
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 17),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: Color(0xFFEBEBEB),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1)),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          "Password",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF263060),
                                fontSize: 15,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: BlocBuilder<LoginCubit, LoginState>(
                            bloc: BlocProvider.of<LoginCubit>(context),
                            buildWhen: (previous, current) =>
                                current is LoginViewPassword||current is LoginInitial,
                            builder: (context, state) {
                              return TextFormField(
                                obscureText: state is LoginViewPassword? state.isPasswordObscure:true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 17),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 1)),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<LoginCubit>(context).viewPassword();
                                    },
                                    child: Icon(
                                        (state is LoginViewPassword? state.isPasswordObscure:true)
                                        ?Icons.visibility_off:
                                        Icons.visibility,
                                        ),
                                  ),
                                ),
                                onChanged: (value) {
                                  // controller.password = value;
                                },
                                validator: (value) {
                                  return (value ?? "").isEmpty
                                      ? "Please, enter your password"
                                      : null;
                                },
                              );
                            },
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                            bloc: BlocProvider.of<LoginCubit>(context),
                            // buildWhen: (previous, current) =>
                            // current is LoginLoading||current is LoginInitial,
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const SizedBox(
                                  height: 48,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              } else {
                                return InkWell(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 28),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Color(0xFFFFC801),
                                    ),
                                    width: double.infinity,
                                    height: 55,
                                    child: Center(
                                      child: Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (loginKey.currentState?.validate() ==
                                        true) {
                                      // controller.signIn();
                                    }
                                  },
                                );
                              }
                            }),
                        const Spacer(
                          flex: 2,
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "By Signing in You Are Agreeing to Our\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                TextSpan(
                                  text: "Terms and Conditions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/cubits/auth_cubits.dart';
import 'package:feda_vest_group_project/cubits/auth_state.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/global_widgets/app_text.dart';
import 'package:feda_vest_group_project/global_widgets/app_text_field.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/utils/auth_validators.dart';
import 'package:feda_vest_group_project/widgets/auth_header.dart';
import 'package:feda_vest_group_project/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isFoodSelected = true;
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  bool showpassword = true;
  String? emailError;
  String? passwordError;
  bool isValidated = false;

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() => setState(() {}));
    passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  void validateFields() {
    final authCubit = context.read<AuthCubit>();
    final email = authCubit.emailcontroller.text.trim();
    final password = authCubit.passwordcontroller.text.trim();
    final emailValidation = AuthValidators.validateEmail(email);
    final passwordValidation = AuthValidators.validatePassword(password);

    setState(() {
      emailError = emailValidation;
      passwordError = passwordValidation;
      isValidated = emailError == null && passwordError == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocListener<AuthCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginState) {
          Navigator.pushNamed(context, RouteName.bottomNav);
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              AuthHeader(
                isSigninScreen: true,
                heading: "FedaVest",
                subheading: "Invest in food Security",
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Welcome Back",
                      color: AppColors.appTextColor,
                      textSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: "Log in to continue",
                      color: AppColors.appTextColor,
                      textSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: size.width * 0.03),
                    AppTextField(
                      icon: Icons.email_outlined,
                      focusNode: emailFocus,
                      onChanged: (_) => validateFields(),

                      label: "Email",
                      hint: "Enter your email",
                    ),
                    if (emailFocus.hasFocus && emailError != null)
                      Padding(
                      padding: const EdgeInsets.only(bottom:10),
                        child: Text(
                          emailError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    AppTextField(
                      controller: context.read<AuthCubit>().passwordcontroller,
                      label: "Password",
                      hint: "Min. 6 characters",
                      hasImage: true,

                      image: Image.asset(AuthImages.lock),
                      isPassword: true,
                      focusNode: emailFocus,
                      onChanged: (_) => validateFields(),
                      obscureText: showpassword,

                      onToggle: () {
                        setState(() => showpassword = !showpassword);
                      },
                    ),
                       if (passwordFocus.hasFocus && passwordError != null)
                      Padding(
                      padding: const EdgeInsets.only(bottom:10),
                        child: Text(
                          emailError!,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    SizedBox(height: size.width * 0.04),
                    AppButton(
                      text: "Log In",
                      onTap: isValidated
                          ? () {
                              final authCubit = context.read<AuthCubit>();
                              final email = authCubit.emailcontroller.text
                                  .trim();
                            }
                          : null,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Don’t Have an accoun? ",
                          color: Colors.grey,
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.signUp);
                          },
                          child: AppText(
                            text: " Sign Up",

                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

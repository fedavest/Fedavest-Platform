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
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isFoodSelected = true;
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  String get selectedRole => isFoodSelected ? "food_sme" : "investor";

  bool passToggle = true;
  bool showConfirmPassword = true;
  bool isValidated = false;

  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameFocus.addListener(() => setState(() {}));
    emailFocus.addListener(() => setState(() {}));
    passwordFocus.addListener(() => setState(() {}));
    confirmPasswordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  void validateFields() {
    final authCubit = context.read<AuthCubit>();
    final name = authCubit.namecontroller.text.trim();
    final email = authCubit.emailcontroller.text.trim();
    final password = authCubit.passwordcontroller.text.trim();
    final confirmPassword = authCubit.confirmPasswordController.text.trim();

    final nameValidation = AuthValidators.validateName(name);
    final emailValidation = AuthValidators.validateEmail(email);
    final passwordValidation = AuthValidators.validatePassword(password);
    final confirmPasswordValidation = AuthValidators.validateConfirmPassword(
      password,
      confirmPassword,
    );

    setState(() {
      nameError = nameValidation;
      emailError = emailValidation;
      passwordError = passwordValidation;
      confirmPasswordError = confirmPasswordValidation;

      isValidated =
          nameError == null &&
          emailError == null &&
          passwordError == null &&
          confirmPasswordError == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final authCubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          setState(() => isLoading = true);
        } else if (state is RegisteredState) {
          setState(() => isLoading = false);
          Navigator.pushNamed(context, RouteName.bottomNav);
        } else if (state is ErrorState) {
          setState(() => isLoading = false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AuthHeader(showIcon: true),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I am...",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: size.width * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: RoleCard(
                              hasImage: true,
                              // image: Image(image: AssetImage(AuthImages.foodSmeLogoInactive)),
                              title: "A Food SME",
                              subtitle: "Business / NGO",
                              icon: Icons.inventory_2_outlined,
                              selected: isFoodSelected,
                              onTap: () {
                                setState(() => isFoodSelected = true);
                              },
                            ),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Expanded(
                            child: RoleCard(
                              title: "An Investor",
                              subtitle: "Fund projects",
                              icon: Icons.trending_up,
                              selected: !isFoodSelected,
                              onTap: () {
                                setState(() => isFoodSelected = false);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.width * 0.06),
                      AppTextField(
                        onChanged: (_) => validateFields(),
                        controller: authCubit.namecontroller,
                        focusNode: nameFocus,
                        hasImage: true,
                        image: Image.asset(AuthImages.personIcon),
                        label: "Name",
                        hint: "Enter your Name",
                        // icon: Icons.person_outline,
                      ),
                      if (nameFocus.hasFocus && nameError != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Text(
                            nameError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      AppTextField(
                        label: "Email",
                        hint: "Enter your email",
                        icon: Icons.email_outlined,
                        onChanged: (_) => validateFields(),
                        focusNode: emailFocus,
                        controller: authCubit.emailcontroller,
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
                        label: "Password",
                        hint: "Min. 6 characters",
                        hasImage: true,
                        image: Image.asset(AuthImages.lock),
                        isPassword: true,
                        onChanged: (_) => validateFields(),
                        controller: authCubit.passwordcontroller,
                        focusNode: passwordFocus,
                        obscureText: showpasword,
                        onToggle: () {
                          setState(() => showpasword = !showpasword);
                        },
                      ),
                      if (passwordFocus.hasFocus && passwordError != null)
                        Padding(
                           padding: const EdgeInsets.only(bottom:10),
                          child: Text(
                            passwordError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      AppTextField(
                        label: "Confirm Password",
                        hint: "Min. 6 characters",
                        hasImage: true,
                        image: Image.asset(AuthImages.lock),
                        isPassword: true,
                        onChanged: (_) => validateFields(),
                        controller: authCubit.confirmPasswordController,
                        focusNode: confirmPasswordFocus,
                        obscureText: showConfirmPassword,
                        onToggle: () {
                          setState(
                            () => showConfirmPassword = !showConfirmPassword,
                          );
                        },
                      ),
                      if (confirmPasswordFocus.hasFocus &&
                          confirmPasswordError != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Text(
                            confirmPasswordError!,
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ),
                        ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: AppButton(
                          onTap: isValidated 
                              ? () {
                                  authCubit.register(role: selectedRole);
                                }
                              : null,
                          child:Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: "Already have an account? ",
                            color: Colors.grey,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RouteName.signIn);
                            },
                            child: AppText(
                              text: "Log in",
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
      ),
    );
  }
}

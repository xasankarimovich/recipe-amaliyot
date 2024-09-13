import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shirinim_flutter/ui/screens/auth/register_screen.dart';
import 'package:shirinim_flutter/utils/extension/extension.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/auth/login_request.dart';
import '../../../utils/style/app_text_style.dart';
import '../../../utils/ui_utils/ui_utils.dart';
import '../../widgets/clipper.dart';
import '../../widgets/global_button_widget.dart';
import '../../widgets/tab_box.dart';
import 'login_start_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedAuthState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TabBoxScreen();
              },
            ),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return LoginStartScreen();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Register',
                  style: AppTextStyle.medium,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Login!",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                10.boxH(),
                FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 100),
                  child: Text(
                    "Please login to your account",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
                40.boxH(),
                FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),

                  ),
                ),
                20.boxH(),
                FadeInLeft(
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: !isShow,
                        controller: _passwordController,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: Theme.of(context).primaryColor,
                        maxLength: 10,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 10),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isShow = !isShow;
                              });
                            },
                            icon: Icon(
                              isShow ? Icons.visibility_off : Icons.visibility,
                            ),
                          ),
                          labelText: 'Password',
                          border: InputBorder.none,
                        ),
                        validator: MinLengthValidator(6,
                            errorText:
                            'Password must be at least 6 digits long')
                            .call,
                      ),
                      // Torch Effect Section
                      if (isShow)
                        Padding(
                          padding: const EdgeInsets.only(right: 40, top: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ClipPath(
                              clipper: MyClipper(),
                              child: Container(
                                height: 47,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _passwordController.text,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                10.boxH(),
                FadeInRight(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 200),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Forgot password functionality
                      },
                      child: const Text("Forgot Password?"),
                    ),
                  ),
                ),
                30.boxH(),
                BounceInUp(
                  duration: const Duration(milliseconds: 700),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return GlobalLoadingButton(
                          title: 'Login',
                          onTap: () {
                            if (state is LoadingAuthState) {
                              return;
                            }

                              if (_formKey.currentState!.validate()) {
                                final request = LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                context
                                    .read<AuthBloc>()
                                    .add(LoginAuthEvent(request: request));
                              }
                            },isLoading:  state is LoadingAuthState,
                          );

                      },

                      listener: (BuildContext context, AuthState state) {
                        if (state is AuthenticatedAuthState) {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => TabBoxScreen()));
                        }
                        if (state is ErrorAuthState) {
                          showErrorMessage(
                            message: state.message,
                            context: context,
                            onTap: () {
                              context.read<AuthBloc>().add(InitialAuthState() as AuthEvent);
                              Navigator.pop(context);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                20.boxH(),
                BounceInLeft(
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary22Opacity,
                            elevation: 0,
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                SocialLoginAuthEvent(SocialLoginType.google));
                          },
                          child: SvgPicture.asset(Images.google),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary22Opacity,
                            elevation: 0,
                          ),
                          onPressed: () {
                            // facebook sign in
                            context.read<AuthBloc>().add(
                                SocialLoginAuthEvent(SocialLoginType.facebook));
                          },
                          child: SvgPicture.asset(Images.apple),
                        ),
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

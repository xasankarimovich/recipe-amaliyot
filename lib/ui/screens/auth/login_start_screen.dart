import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shirinim_flutter/core/extensions/extensions.dart';
import 'package:shirinim_flutter/ui/screens/auth/register_screen.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/helpers/dialog.dart';
import '../../widgets/tab_box.dart';
import 'login_screen.dart'; // Importing animate_do

class LoginStartScreen extends StatelessWidget {
  const LoginStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          AppDialogs.showLoading(context);
        } else {
          AppDialogs.hideLoading(context);
        }

        if (state is AuthenticatedAuthState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const TabBoxScreen();
            }),
            (route) => false,
          );
        }

        if (state is ErrorAuthState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 538.h,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Images.loginBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create an\nAccount",
                        style: TextStyles.medium.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur  elit, sed do eiusmod tempor incididunt ut.",
                        style: const TextStyle(
                          color: Colors.white,
                        ).gordita,
                      ),
                      const SizedBox(height: 45),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  BounceInLeft(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 200),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.email_outlined,
                          size: 20,
                        ),
                        label: const Text("Register using email"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

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
                            onPressed: () {},
                            child: SvgPicture.asset(Images.apple),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // BounceInLeft animation for the login link
                  BounceInLeft(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 400),
                    child: TextButton(
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return LoginScreen();
                                      },
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/reset_password.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/verification_metod.dart';
import 'package:shirinim_flutter/utils/extension/extension.dart';
import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/global_button_widget.dart';
class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 100,
        leading: CircleAvatar(
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) {
                    return ResetPasswordScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot\nPassword',
              style: AppTextStyle.semiBold,
            ),
            16.boxH(),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              style: Theme.of(context).textTheme.bodyMedium,
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
                //---------------------------------------------validator yuq qushmadim hali'
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlobalLoadingButton(
                title: 'Next',
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) {
                        return VerificationMethodScreen();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

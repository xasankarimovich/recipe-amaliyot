import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/verify_phone_screen.dart';
import 'package:shirinim_flutter/utils/extension/extension.dart';
import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/global_button_widget.dart';
import 'forgot_password_screen.dart';
class VerificationMethodScreen extends StatelessWidget {
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
                    return ForgotPasswordScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text('Verification\nMethod', style: AppTextStyle.semiBold),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle email verification
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF462F4D),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.email, size: 40),
                          8.boxH(),

                          Text('Email',style: AppTextStyle.medium.copyWith(color: Colors.white),),
                          Text('samantha@email.com',style: AppTextStyle.thin.copyWith(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle phone verification
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.phone, size: 40),
                          8.boxH(),

                          Text('Phone'),
                          8.boxH(),
                          Text('+998 90 123 99 11'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            GlobalLoadingButton(title: 'Next', onTap: (){
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (ctx) {
                    return VerifyPhoneScreen();
                  },
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}

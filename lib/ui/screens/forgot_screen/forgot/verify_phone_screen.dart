import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/reset_password.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/verification_metod.dart';
import 'package:shirinim_flutter/utils/extension/extension.dart';

import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/global_button_widget.dart';
class VerifyPhoneScreen extends StatelessWidget {
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
                    return VerificationMethodScreen();
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
              'Verify Phone',
              style: AppTextStyle.semiBold
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 40),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: '3 2 -',
                contentPadding: EdgeInsets.symmetric(vertical: 20),
              ),
              keyboardType: TextInputType.number,
              maxLength: 5,
            ),
            16.boxH(),
            Spacer(),
            GlobalLoadingButton(
              title: 'Verify and continue',
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ctx) {
                      return ResetPasswordScreen();
                    },
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

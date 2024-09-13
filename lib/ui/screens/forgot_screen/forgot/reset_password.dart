import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/selector_country_screen.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/forgot/verify_phone_screen.dart';
import 'package:shirinim_flutter/utils/extension/extension.dart';

import '../../../../utils/style/app_text_style.dart';
import '../../../widgets/global_button_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
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
                    return VerifyPhoneScreen();
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

            Text('Reset Password', style: AppTextStyle.semiBold),
            16.boxH(),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            40.boxH(),

            TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            16.boxH(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            Spacer(),
            GlobalLoadingButton(
              title: 'Next',
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ctx) {
                      return CountrySelectionScreen();
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

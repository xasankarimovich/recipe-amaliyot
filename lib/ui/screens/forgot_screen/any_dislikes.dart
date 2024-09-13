import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirinim_flutter/ui/screens/forgot_screen/preference_screen.dart';
import '../../../core/constants/app_constants.dart';
import '../../../utils/style/app_text_style.dart';
import 'account_setup.dart';

class AnyDislikes extends StatelessWidget {
  const AnyDislikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        leading: CircleAvatar(

          child: IconButton(
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (ctx){
                return OrbitingFoodUI();
              },),);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white), // Iconning rangini belgilash
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: AppTextStyle.medium.copyWith(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text('Any\n Dislikes?',style: AppTextStyle.semiBold.copyWith(fontSize: 40),),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: OrbitPainter(),
            ),
          ),
          // Markazdagi taom rasmi
          Center(
            child: Container(
              width: 140.w,
              height: 140.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/centerFood.png',
                  ),
                  // Markazdagi taom rasmi
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(Images.onVeggies, width: 50, height: 50),

                Text('Veggies', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 300,
            right: 40,
            child: Column(
              children: [
                Image.asset(Images.onChicken, width: 50, height: 50),
                // Taom rasmi
                Text('Chicken', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 300,
            left: 40,
            child: Column(
              children: [
                Image.asset(Images.onEggs, width: 50, height: 50),
                // Taom rasmi
                Text('Eggs', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 350,
            right: 110,
            child: Column(
              children: [
                Image.asset(Images.onOctopus, width: 50, height: 50), // Taom rasmi
                Text('Octopus', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 400,
            left: 106,
            child: Column(
              children: [
                Image.asset(Images.onSushi, width: 50, height: 50),
                // Taom rasmi
                Text('Sushi', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 470,
            right: 120,
            child: Column(
              children: [
                Image.asset(Images.onApple, width: 50, height: 50), // Taom rasmi
                Text('Apple', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 550,
            left: 40,
            child: Column(
              children: [
                Image.asset(Images.onBacon, width: 50, height: 50),
                // Taom rasmi
                Text('Bacon', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Positioned(
            top: 640,
            right: 150,
            child: Column(
              children: [
                Image.asset(Images.onMeat, width: 50, height: 50), // Taom rasmi
                Text('Meat', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx){
              return AccountSetupApp();
            },),);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue'),
              Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

class OrbitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5.w;

    // Birinchi orbitani chizish
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 90.h, paint);
    // Ikkinchi orbitani chizish
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 160.h, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

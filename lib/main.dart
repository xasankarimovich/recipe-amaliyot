import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shirinim_flutter/ui/screens/splash/views/welcome_screen.dart';

import 'blocs/auth/auth_bloc.dart';
import 'core/di/di.dart';
import 'core/themes/app_themes.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: getIt.get<AuthRepository>(),
              userRepository: getIt.get<UserRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Shirinim',
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          home: const WelcomeScreen(),
        ),
      ),
    );
  }
}

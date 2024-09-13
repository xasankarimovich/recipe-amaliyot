import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../data/models/auth/register_request.dart';
import '../../widgets/clipper.dart';
import '../../widgets/tab_box.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isShow = false;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedAuthState) {
          // Debugging/logging state
          print("AuthenticatedAuthState received, navigating to TabBoxScreen");

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => TabBoxScreen(),
            ),
            (route) => false,
          );
        } else if (state is ErrorAuthState) {
          // Handle errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return LoginScreen();
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
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 0.8.sh,
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 500),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator:
                          RequiredValidator(errorText: 'Name is required').call,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator:
                        EmailValidator(errorText: 'Enter a valid email').call,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Phone number is required'),
                      MinLengthValidator(10,
                          errorText: 'Enter a valid phone number'),
                    ]).call,
                  ),
                  const SizedBox(height: 15),
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
                                isShow
                                    ? Icons.visibility_off
                                    : Icons.visibility,
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
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordConfirmController,
                    decoration:
                        const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty) return 'Confirm your password';
                      if (val != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  BounceInRight(
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (state is LoadingAuthState) {
                                return;
                              }

                              if (_formKey.currentState!.validate()) {
                                final request = RegisterRequest(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _passwordConfirmController.text,
                                );
                                context
                                    .read<AuthBloc>()
                                    .add(RegisterAuthEvent(request: request));
                              }
                            },
                            child: state is LoadingAuthState
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text('Register'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

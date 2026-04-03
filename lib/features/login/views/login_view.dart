import 'package:depi/core/utils/functions/app_router.dart';
import 'package:depi/features/login/controllers/login_cubit.dart';
import 'package:depi/features/login/controllers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          showAboutDialog(
            context: context,
            barrierDismissible: true,
            children: [Text(state.message)],
          );
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح')));
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 80.h),
                  TextFormField(
                    controller: cubit.emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الإلكتروني',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'يرجى إدخال البريد الإلكتروني' : null,
                  ),
                  TextFormField(
                    controller: cubit.passwordController,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.changePasswordVisibility();
                        },
                      ),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'يرجى إدخال كلمة المرور' : null,
                    obscureText: cubit.isPasswordVisible,
                  ),
                  ElevatedButton(
                    onPressed: (state is LoginLoading)
                        ? null
                        : () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.login();
                            }
                          },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                    ),
                    child: (state is LoginLoading)
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ليس لديك حساب؟'),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kRegisterView);
                        },
                        child: Text('إنشاء حساب'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

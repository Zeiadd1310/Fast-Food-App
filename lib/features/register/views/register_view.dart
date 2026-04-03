import 'package:depi/core/utils/functions/app_router.dart';
import 'package:depi/features/register/controllers/register_cubit.dart';
import 'package:depi/features/register/controllers/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('تم إنشاء الحساب بنجاح')));
            GoRouter.of(context).push(AppRouter.kHomeView);
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إنشاء حساب',
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
                  TextFormField(
                    controller: cubit.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'تأكيد كلمة المرور',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          cubit.changeConfirmPasswordVisible();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى تأكيد كلمة المرور';
                      } else if (value != cubit.passwordController.text) {
                        return 'كلمتا المرور غير متطابقتين';
                      }
                      return null;
                    },
                    obscureText: cubit.isConfirmPasswordVisible,
                  ),
                  ElevatedButton(
                    onPressed: (state is RegisterLoading)
                        ? null
                        : () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.register();
                            }
                          },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                    ),
                    child: (state is RegisterLoading)
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'إنشاء حساب',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('لديك حساب بالفعل؟'),
                      TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kLoginView);
                        },
                        child: Text('تسجيل الدخول'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

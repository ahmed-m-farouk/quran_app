import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/future_home/view/screen/home_screen/home_scren.dart';
import 'package:quran/features/future_login/cubit/auth_cubit.dart';
import 'package:quran/features/future_login/view/widgets/wdget_textfiled/text_form_filed.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authsuccesslogin) {
          if (state.user['status'] == 'success') {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم تسجيل الدخول بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScren(),
                ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('فشل في تسجيل الدخول'),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else if (state is Authfaluierlogin) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.rerro.isNotEmpty
                    ? 'خطأ: ${state.rerro}'
                    : 'حدث خطأ غير معروف',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(120.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: AppBar(
                  backgroundColor: Colors.teal,
                  title: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset('images/image2.png'),
                      ),
                      defaultTextField(
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'برجاء إدخال البريد الإلكتروني.';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'يرجى إدخال بريد إلكتروني صالح.';
                          }
                          return null;
                        },
                        label: 'البريد الإلكتروني',
                        hint: 'أدخل بريدك الإلكتروني',
                        prefixIcon: Icons.email_rounded,
                        suffix: Icons.clear,
                        suffixfunction: () {
                          emailController.clear();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultTextField(
                        inputType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يرجى إدخال كلمة المرور.';
                          } else if (value.length < 6) {
                            return 'كلمة المرور يجب أن تكون مكونة من 6 أحرف على الأقل.';
                          }
                          return null;
                        },
                        label: 'كلمة المرور',
                        hint: 'أدخل كلمة المرور',
                        prefixIcon: Icons.lock_rounded,
                        suffix: Icons.clear,
                        suffixfunction: () {
                          passwordController.clear();
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.postlogincupit(
                                emaildata: emailController.text,
                                passworddata: passwordController.text);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 300,
                          height: 50,
                          child: const Center(
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ليس لديك حساب؟ ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ));
                            },
                            child: const Text(
                              'إنشاء حساب',
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

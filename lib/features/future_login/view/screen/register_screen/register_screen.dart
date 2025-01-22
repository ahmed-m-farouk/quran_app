import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/future_login/cubit/auth_cubit.dart';
import 'package:quran/features/future_login/view/widgets/wdget_textfiled/text_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameControl = TextEditingController();
    TextEditingController emailControl = TextEditingController();
    TextEditingController passControl = TextEditingController();
    TextEditingController imageControl = TextEditingController();
    TextEditingController nationalControl = TextEditingController();
    TextEditingController phoneControl = TextEditingController();
    TextEditingController genderControl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authsuccessregister) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء الحساب بنجاح!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state is Authfaluierregister) {
          String errorMessage = state.error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        AuthCubit cubit = BlocProvider.of<AuthCubit>(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'إنشاء حساب جديد',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.teal,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //  الاسم
                        defaultTextField(
                          inputType: TextInputType.name,
                          controller: nameControl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال الاسم بالكامل.';
                            }
                            return null;
                          },
                          label: 'الاسم الكامل',
                          hint: 'أدخل اسمك الكامل',
                          prefixIcon: Icons.person,
                          suffix: Icons.clear,
                          suffixfunction: () => nameControl.clear(),
                        ),
                        const SizedBox(height: 15),
                        //  البريد الإلكتروني
                        defaultTextField(
                          inputType: TextInputType.emailAddress,
                          controller: emailControl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال البريد الإلكتروني.';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'يرجى إدخال بريد إلكتروني صالح.';
                            }
                            return null;
                          },
                          label: 'البريد الإلكتروني',
                          hint: 'أدخل بريدك الإلكتروني',
                          prefixIcon: Icons.email,
                          suffix: Icons.clear,
                          suffixfunction: () => emailControl.clear(),
                        ),
                        const SizedBox(height: 15),
                        //  كلمة المرور
                        defaultTextField(
                          inputType: TextInputType.visiblePassword,
                          controller: passControl,
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
                          prefixIcon: Icons.lock,
                          suffix: Icons.clear,
                          suffixfunction: () => passControl.clear(),
                        ),
                        const SizedBox(height: 15),
                        //  رقم الهاتف
                        defaultTextField(
                          inputType: TextInputType.phone,
                          controller: phoneControl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال رقم الهاتف.';
                            } else if (!RegExp(r'^[0-9]{10,15}$')
                                .hasMatch(value)) {
                              return 'يرجى إدخال رقم هاتف صالح.';
                            }
                            return null;
                          },
                          label: 'رقم الهاتف',
                          hint: 'أدخل رقم هاتفك',
                          prefixIcon: Icons.phone,
                          suffix: Icons.clear,
                          suffixfunction: () => phoneControl.clear(),
                        ),
                        const SizedBox(height: 15),
                        //  الرقم الوطني
                        defaultTextField(
                          inputType: TextInputType.text,
                          controller: nationalControl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال الرقم الوطني.';
                            }
                            return null;
                          },
                          label: 'الرقم الوطني',
                          hint: 'أدخل الرقم الوطني',
                          prefixIcon: Icons.credit_card,
                          suffix: Icons.clear,
                          suffixfunction: () => nationalControl.clear(),
                        ),
                        const SizedBox(height: 15),
                        //  الجنس
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'الجنس',
                            hintText: 'اختر الجنس',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: null,
                          items: ['male', 'female'].map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender == 'male' ? 'ذكر' : 'أنثى'),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            genderControl.text = newValue!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى اختيار الجنس.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        //  الصورة الشخصية
                        defaultTextField(
                          inputType: TextInputType.url,
                          controller: imageControl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى إدخال رابط الصورة الشخصية.';
                            } else if (!Uri.parse(value).isAbsolute) {
                              return 'يرجى إدخال رابط صالح.';
                            }
                            return null;
                          },
                          label: 'رابط الصورة الشخصية',
                          hint: 'أدخل رابط الصورة',
                          prefixIcon: Icons.image,
                          suffix: Icons.clear,
                          suffixfunction: () => imageControl.clear(),
                        ),
                        const SizedBox(height: 25),

                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.postregistercupit(
                                namedata: nameControl.text,
                                emaildata: emailControl.text,
                                phonedata: phoneControl.text,
                                nationalIddata: nationalControl.text,
                                genderdata: genderControl.text,
                                passworddata: passControl.text,
                                profileImagedata: imageControl.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'إنشاء حساب',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        if (state is Authloadingregister)
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
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

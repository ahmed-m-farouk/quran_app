import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran/features/future_login/cubit/auth_cubit.dart';
import 'package:quran/features/future_profile/cubit/profile_cubit.dart';
import 'package:quran/features/future_quran/cubit/quran_cubit.dart';
import 'package:quran/splash_screen/splash_screen.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => QuranCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..profileDataCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

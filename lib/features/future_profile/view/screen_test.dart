import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/future_profile/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Profile',
          style: const TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ErrorProfile) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is SuccessProfile) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        NetworkImage(state.profileModelUserData.profileImage),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.person, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        state.profileModelUserData.name,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.email, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        state.profileModelUserData.email,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.call, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        state.profileModelUserData.phone,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(Icons.card_travel, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        state.profileModelUserData.nationalId,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                ],
              );
            } else if (state is LoadingProfileCubit) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text('Error loading profile data.'));
            }
          },
        ),
      ),
    );
  }
}

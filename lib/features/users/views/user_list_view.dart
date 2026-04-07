import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi/features/users/controllers/users_cubit.dart';
import 'package:depi/features/users/controllers/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class UserListView extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersError) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('قائمة المستخدمين'),
                backgroundColor: Colors.white,
              ),
              body: Center(child: Text(state.message)),
            );
          } else if (state is UsersLoading) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('قائمة المستخدمين'),
                backgroundColor: Colors.white,
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is UsersLoaded) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('قائمة المستخدمين'),
                backgroundColor: Colors.white,
              ),
              body: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(state.users[index]));
                },
              ),
            );
            // } else if (state is UsersInitial) {
            //   context.read<UsersCubit>().getUsers();
            //   return Scaffold(
            //     backgroundColor: Colors.white,
            //     appBar: AppBar(
            //       title: const Text('قائمة المستخدمين'),
            //       backgroundColor: Colors.white,
            //     ),
            //     body: const Center(child: CircularProgressIndicator()),
            //   );
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('قائمة المستخدمين'),
                backgroundColor: Colors.white,
              ),
              body: Center(
                child: Text(
                  'لا يوجد مستخدمين',
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

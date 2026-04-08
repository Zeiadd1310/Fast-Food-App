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
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16.h,
                    children: [
                      SizedBox(height: 0.h),
                      TextField(
                        controller: context.read<UsersCubit>().nameController,
                        decoration: InputDecoration(
                          labelText: 'اسم المستخدم',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        controller: context.read<UsersCubit>().ageController,
                        decoration: InputDecoration(
                          labelText: 'العمر',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<UsersCubit>().addUsers();
                            },
                            child: Text('إضافة مستخدم'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<UsersCubit>().updateUser();
                            },
                            child: Text('تحديث مستخدم'),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.users[index].fullName),
                            subtitle: Text('العمر: ${state.users[index].age}'),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                context.read<UsersCubit>().selectUpdatedUser(
                                  state.users[index],
                                );
                              },
                            ),
                            leading: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                context.read<UsersCubit>().deleteUser(
                                  state.users[index].id!,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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

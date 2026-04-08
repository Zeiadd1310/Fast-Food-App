import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi/features/users/controllers/users_state.dart';
import 'package:depi/features/users/models/users_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()) {
    getUsers();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String selectedUserId = '';

  Stream collectionStream = FirebaseFirestore.instance
      .collection('users')
      .snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void deleteUser(String id) async {
    try {
      await users.doc(id).delete();
      getUsers();
    } on Exception catch (e) {
      emit(UsersError('فشل حذف المستخدم: ${e.toString()}'));
    }
  }

  void selectUpdatedUser(UsersModel user) {
    selectedUserId = user.id!;
    nameController.text = user.fullName;
    ageController.text = user.age.toString();
  }

  void updateUser() async {
    Map<String, dynamic> updatedData = {};
    updatedData.addEntries([
      if (nameController.text.isNotEmpty)
        MapEntry('full_name', nameController.text),
      if (ageController.text.isNotEmpty)
        MapEntry('age', int.parse(ageController.text)),
    ]);
    try {
      await users.doc(selectedUserId).update(updatedData);
      nameController.clear();
      ageController.clear();
      selectedUserId = '';
      getUsers();
    } on Exception catch (e) {
      emit(UsersError('فشل تحديث المستخدم: ${e.toString()}'));
    }
  }

  addUsers() async {
    await users.add({
      'full_name': nameController.text,
      'age': int.parse(ageController.text),
    });
    nameController.clear();
    ageController.clear();
    getUsers();
  }

  getUsersStream() {
    collectionStream.listen(
      (snapshot) {
        List<UsersModel> userList = [];
        for (var doc in snapshot.docs) {
          userList.add(
            UsersModel(
              age: doc['age'] as int,
              fullName: doc['full_name'] as String,
              id: doc.id,
            ),
          );
        }
        emit(UsersLoaded(userList));
      },
      onError: (error) {
        emit(UsersError(error.toString()));
      },
    );
  }

  void getUsers() async {
    emit(UsersLoading());
    try {
      QuerySnapshot snapshot = await users
          .where('age', isGreaterThan: 2)
          .orderBy('full_name', descending: false)
          .get();
      List<UsersModel> userList = snapshot.docs
          .map(
            (doc) => UsersModel(
              age: doc['age'] as int,
              fullName: doc['full_name'] as String,
              id: doc.id,
            ),
          )
          .toList();
      emit(UsersLoaded(userList));
    } on Exception catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi/features/users/controllers/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()) {
    getUsers();
  }

  // getUsersStream() {
  //   Stream collectionStream = FirebaseFirestore.instance
  //       .collection('users')
  //       .snapshots();
  //   collectionStream.listen(
  //     (snapshot) {
  //       List<String> userList = [];
  //       for (var doc in snapshot.docs) {
  //         userList.add(doc['full_name']);
  //       }
  //       emit(UsersLoaded(userList));
  //     },
  //     onError: (error) {
  //       emit(UsersError(error.toString()));
  //     },
  //   );
  // }

  void getUsers() async {
    emit(UsersLoading());
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      QuerySnapshot snapshot = await users
          .where('age', isGreaterThan: 2)
          .orderBy('full_name', descending: false)
          .get();
      List<String> userList = snapshot.docs
          .map(
            (doc) =>
                'Full Name: ' +
                doc['full_name'] +
                ', Age: ' +
                doc['age'].toString(),
          )
          .toList();
      emit(UsersLoaded(userList));
    } on Exception catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}

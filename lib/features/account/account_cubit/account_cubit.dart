import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountInitial());

  Future<void> loadAccount() async {
    try {
      emit(AccountLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AccountSuccess());
    } catch (e) {
      emit(AccountFailure());
    }
  }

  void logout() {
    emit(AccountInitial());
  }
}

part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountSuccess extends AccountState {}

final class AccountFailure extends AccountState {}

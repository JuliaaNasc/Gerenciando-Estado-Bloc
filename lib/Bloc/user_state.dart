part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String userId;
  final String userName;

  const UserLoaded({required this.userId, required this.userName});

  @override
  List<Object?> get props => [userId, userName];
}

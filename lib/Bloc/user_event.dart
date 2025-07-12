part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String userId;
  final String userName;

  const LoadUser({required this.userId, required this.userName});

  @override
  List<Object> get props => [userId, userName];
}

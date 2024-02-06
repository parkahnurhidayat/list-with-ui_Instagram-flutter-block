// user_list_event.dart
import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class GetUserList extends UserListEvent {
  final int pageKey;

  const GetUserList({
    required this.pageKey,
  });

  @override
  List<Object> get props => [pageKey];
}
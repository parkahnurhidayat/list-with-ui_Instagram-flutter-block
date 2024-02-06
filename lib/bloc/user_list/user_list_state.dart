// user_list_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_block/data/entities/user_list_entity.dart';
import 'package:flutter_block/data/models/user_list_model.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListEmpty extends UserListState {}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final UserListEntity data;
  final int nextPageKey;

  const UserListLoaded({
    required this.data,
    required this.nextPageKey,
  });

  @override
  List<Object> get props => [data, nextPageKey];
}

class UserListLastPageLoaded extends UserListState {
  final UserListEntity data;

  const UserListLastPageLoaded({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class UserListError extends UserListState {
  final String message;
  final int code;

  const UserListError({
    required this.message, 
    required this.code
  });

  @override
  List<Object> get props => [message, code];
}
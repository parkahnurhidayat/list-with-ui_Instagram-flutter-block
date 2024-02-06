// user_list_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/user_list/user_list_event.dart';
import 'package:flutter_block/bloc/user_list/user_list_state.dart';
import 'package:flutter_block/data/repositories/app_repository.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final AppRepository repository;
  

  static const int _pageLimit = 5;

  UserListBloc({
    required this.repository,
  }) : super(UserListLoading()) {
    on<GetUserList>((event, emit) async {
      try {
        //await Future.delayed(const Duration(seconds: 5));
        emit(UserListLoading());
        final entity = await repository.getContentUserList(
          event.pageKey,
          _pageLimit,
        );
        final isLastPage = entity.datas.length < event.pageKey;
        if (isLastPage) {
          emit(UserListLastPageLoaded(data:entity));
        } else {
          final nextPageKey = event.pageKey + 1;
          emit(UserListLoaded(data: entity, nextPageKey: nextPageKey));
        }
      } on Exception catch (e, stackTrace) {
        debugPrint(stackTrace.toString());
      } catch (e, stackTrace) {
        debugPrint(stackTrace.toString());
      }
    });
  }
}

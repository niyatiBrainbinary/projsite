

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proj_site/api%20service/models/project_list_models/project_details_model.dart';
import 'package:proj_site/api%20service/models/project_list_models/project_list_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/remove_user_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/sub_project_list_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/sub_project_user_list_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/userListDropDownModel.dart';
import 'package:proj_site/api%20service/repository.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';
import 'package:proj_site/cubits/auth_cubit.dart';
import 'package:proj_site/helper/helper.dart';
import 'package:proj_site/services/sharedpreference_service.dart';


abstract class SubProjectUserListState {}

class SubProjectUserListInitial extends SubProjectUserListState {}



class SubProjectUserListLoading extends SubProjectUserListState {}
class SubProjectUserListSuccess extends SubProjectUserListState {}
class SubProjectUserListError extends SubProjectUserListState {}

class RemoveUserLoading extends SubProjectUserListState {}
class RemoveUserSuccess extends SubProjectUserListState {}
class RemoveUserError extends SubProjectUserListState {}

class UserListDropDownLoading extends SubProjectUserListState {}
class UserListDropDownSuccess extends SubProjectUserListState {}
class UserListDropDownError extends SubProjectUserListState {}



class SubProjectUserListCubit extends Cubit<SubProjectUserListState> {
  SubProjectUserListCubit() : super(SubProjectUserListInitial());

  setState(){
    emit(SubProjectUserListInitial());
  }

  List <SubProjectUser> subProjectUserList = [];

  List userListDropDown = [];

  SharedPreferenceService prefs = SharedPreferenceService();

  late AuthCubit authCub;

  void SubProjectUserList(String subProjectId, String orgId, BuildContext context) async {
    emit(SubProjectUserListLoading());
    orgId = (await prefs.getStringData("organizationId")).toString();
    //  orgVal = (await prefs.getStringData("organizationVal")).toString();


    SubProjectUserListModel? response = await Repository.postSubProjectUserList(subProjectId,orgId);

    if (response != null) {
      if (response.success == true) {
        //organization = [];
        subProjectUserList = [];
        //organization = response.organizations!;
        subProjectUserList = response.subProjectUsers!;
        emit(SubProjectUserListSuccess());
      } else {
        snackBar("Something Went Wrong", false);
        emit(SubProjectUserListError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(SubProjectUserListError());
    }

  }

  void RemoveUser({required BuildContext context,required String orgId, required String subProjectId, required String userId}) async {

    emit(RemoveUserLoading());

    RemoveUserModel? response = await Repository.postRemoveUser(orgId: orgId, subProjectId: subProjectId, userId: userId);

    if (response != null) {
      if (response.success == true) {
        SubProjectUserList(subProjectId, orgId, context);
        Navigator.pop(context);
        snackBar("Successfully", true);
        emit(RemoveUserSuccess());

      } else {
        snackBar("Something Went Wrong", false);
        emit(RemoveUserError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(RemoveUserError());
    }
  }

  void UserListDropDown(String projectId) async {
    emit(UserListDropDownLoading());

    orgId = (await prefs.getStringData("organizationId")).toString();


    UserListDropDownModel? response = await Repository.postUserListDropDown(projectId);

    if (response != null) {
      if (response.success == true) {


        for(int i=0; i<=response.users!.length ; i++){
          print(response.users!["$i"]);
          if(response.users?["$i"] != null){
            userListDropDown.add("${response.users?["$i"]?.firstName ?? ""} ${response.users?["$i"]?.lastName ?? ""}");
          }

        }

       print(userListDropDown);

        emit(UserListDropDownSuccess());
      } else {
        snackBar("Something Went Wrong", false);
        emit(UserListDropDownError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(UserListDropDownError());
    }

  }

}


import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proj_site/api%20service/models/project_list_models/project_details_model.dart';
import 'package:proj_site/api%20service/models/project_list_models/project_list_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/sub_project_list_model.dart';
import 'package:proj_site/api%20service/models/sub_project_models/sub_project_user_list_model.dart';
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



class SubProjectUserListCubit extends Cubit<SubProjectUserListState> {
  SubProjectUserListCubit() : super(SubProjectUserListInitial());

  setState(){
    emit(SubProjectUserListInitial());
  }

  List <SubProjectUser> subProjectUserList = [];

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

/* void ProjectDetails(String projectId) async {
    emit(ProjectDetailsLoading());
    projectDetails = await Repository.postProjectDetails(projectId);

    if (projectDetails != null) {
      if (projectDetails!.success == true) {
        emit(ProjectDetailsSuccess());
      } else {
        snackBar("Something Went Wrong", false);
        emit(ProjectDetailsError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(ProjectDetailsError());
    }
  }*/

}
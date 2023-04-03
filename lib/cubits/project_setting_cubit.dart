
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj_site/api%20service/models/project_setting_models/get_booking_form_model.dart';
import 'package:proj_site/api%20service/models/project_setting_models/save_booking_form_model.dart';
import 'package:proj_site/api%20service/repository.dart';
import 'package:proj_site/common/widget_constant/widget_constant.dart';


abstract class ProjectSettingState {}

class ProjectSettingInitial extends ProjectSettingState {}

class BookingFormNotificationLoading extends ProjectSettingState {}
class BookingFormNotificationSuccess extends ProjectSettingState {}
class BookingFormNotificationError extends ProjectSettingState {}

class ProjectSettingCubit extends Cubit<ProjectSettingState> {
  ProjectSettingCubit() : super(ProjectSettingInitial());


  setState(){
    emit(ProjectSettingInitial());
  }
List? shipmentData;
List? environmentData;

  void GetBookingFormNotification() async {
    emit(BookingFormNotificationLoading());
    GetBookingFormModel? response = await Repository.postBookingFormNotification();

    if (response != null) {
      if (response.success == true) {
       final data = response.projectInfo?.projectSettings;
        log("res=$data");
       if(data !=null){
         shipmentData= [data['resource'],data['zone'],data['contractor'],data['responsible_person'],data['sub_project'],];
         environmentData= [data['delivery_supplier'],data['euro_class'],data['type_of_fuel'],data['load_weight'],data['vehicle_capacity'],data['driving_distance'],data['addresses'],data['Type of Vehicle']];
       }
        emit(BookingFormNotificationSuccess());
      } else {
        snackBar("Something Went Wrong", false);
        emit(BookingFormNotificationError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(BookingFormNotificationError());
    }
  }

  void SaveBookingFormNotification({required List<dynamic> shipment,required List<dynamic> environment,}) async {
    emit(BookingFormNotificationLoading());
    SaveBookingFormModel? response = await Repository.postSaveBookingFormNotification(shipment: shipment, environment:environment);
    if (response != null) {
      if (response.success == true) {
        emit(BookingFormNotificationSuccess());
      } else {
        snackBar("Something Went Wrong", false);
        emit(BookingFormNotificationError());
      }
    } else {
      snackBar("Error to Load Data", false);
      emit(BookingFormNotificationError());
    }
  }


}
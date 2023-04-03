

import 'dart:convert';

GetBookingFormModel getBookingFormModelFromJson(String str) => GetBookingFormModel.fromJson(json.decode(str));

String getBookingFormModelToJson(GetBookingFormModel data) => json.encode(data.toJson());

class GetBookingFormModel {
  GetBookingFormModel({
    required this.success,
    required this.projectInfo,
  });

  bool success;
  ProjectInfo? projectInfo;

  factory GetBookingFormModel.fromJson(Map<String, dynamic> json) => GetBookingFormModel(
    success: json["success"] == null ? null : json["success"],
    projectInfo: json["project_info"] == null ? null : ProjectInfo.fromJson(json["project_info"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "project_info": projectInfo == null ? null : projectInfo!.toJson(),
  };
}

class ProjectInfo {
  ProjectInfo({
    required this.id,
    required this.projectName,
    required this.organizationId,
    required this.projectLocation,
    required this.fromDate,
    required this.toDate,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
    required this.createdAt,
    required this.projectSettings,
    required this.wasteLogoId,
    required this.placeId,
    this.checkpoint,
    this.checkpointLocation,
    this.checkpointLatitude,
    this.checkpointLongitude,
    this.checkpointPlaceId,
    required this.hasLogisticsModule,
    required this.hasShipmentModule,
    required this.mailSmsSettings,
    this.projectInfoCheckpointPlaceId,
    this.terminalLatitude,
    this.terminalLocation,
    this.terminalLongitude,
    this.terminalPlaceId,
    required this.projectTerminals,
    required this.organizationName,
  });

  String id;
  String projectName;
  String organizationId;
  String projectLocation;
  String fromDate;
  String toDate;
  bool status;
  String latitude;
  String longitude;
  DateTime? updatedAt;
  DateTime? createdAt;
  Map<String, bool>? projectSettings;
  String wasteLogoId;
  String placeId;
  dynamic checkpoint;
  dynamic checkpointLocation;
  dynamic checkpointLatitude;
  dynamic checkpointLongitude;
  dynamic checkpointPlaceId;
  bool hasLogisticsModule;
  bool hasShipmentModule;
  MailSmsSettings? mailSmsSettings;
  dynamic projectInfoCheckpointPlaceId;
  dynamic terminalLatitude;
  dynamic terminalLocation;
  dynamic terminalLongitude;
  dynamic terminalPlaceId;
  List<String>? projectTerminals;
  String organizationName;

  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
    id: json["_id"] == null ? null : json["_id"],
    projectName: json["project_name"] == null ? null : json["project_name"],
    organizationId: json["organization_id"] == null ? null : json["organization_id"],
    projectLocation: json["project_location"] == null ? null : json["project_location"],
    fromDate: json["from_date"] == null ? null : json["from_date"],
    toDate: json["to_date"] == null ? null : json["to_date"],
    status: json["status"] == null ? null : json["status"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    projectSettings: json["project_settings"] == null ? null : Map.from(json["project_settings"]).map((k, v) => MapEntry<String, bool>(k, v)),
    wasteLogoId: json["waste_logo_id"] == null ? null : json["waste_logo_id"],
    placeId: json["place_id"] == null ? null : json["place_id"],
    checkpoint: json["checkpoint"],
    checkpointLocation: json["checkpoint_location"],
    checkpointLatitude: json["checkpoint_latitude"],
    checkpointLongitude: json["checkpoint_longitude"],
    checkpointPlaceId: json["checkpoint_placeId"],
    hasLogisticsModule: json["has_logistics_module"] == null ? null : json["has_logistics_module"],
    hasShipmentModule: json["has_shipment_module"] == null ? null : json["has_shipment_module"],
    mailSmsSettings: json["mail_sms_settings"] == null ? null : MailSmsSettings.fromJson(json["mail_sms_settings"]),
    projectInfoCheckpointPlaceId: json["checkpoint_place_id"],
    terminalLatitude: json["terminal_latitude"],
    terminalLocation: json["terminal_location"],
    terminalLongitude: json["terminal_longitude"],
    terminalPlaceId: json["terminal_place_id"],
    projectTerminals: json["project_terminals"] == null ? null : List<String>.from(json["project_terminals"].map((x) => x)),
    organizationName: json["organization_name"] == null ? null : json["organization_name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "project_name": projectName == null ? null : projectName,
    "organization_id": organizationId == null ? null : organizationId,
    "project_location": projectLocation == null ? null : projectLocation,
    "from_date": fromDate == null ? null : fromDate,
    "to_date": toDate == null ? null : toDate,
    "status": status == null ? null : status,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "project_settings": projectSettings == null ? null : Map.from(projectSettings!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "waste_logo_id": wasteLogoId == null ? null : wasteLogoId,
    "place_id": placeId == null ? null : placeId,
    "checkpoint": checkpoint,
    "checkpoint_location": checkpointLocation,
    "checkpoint_latitude": checkpointLatitude,
    "checkpoint_longitude": checkpointLongitude,
    "checkpoint_placeId": checkpointPlaceId,
    "has_logistics_module": hasLogisticsModule == null ? null : hasLogisticsModule,
    "has_shipment_module": hasShipmentModule == null ? null : hasShipmentModule,
    "mail_sms_settings": mailSmsSettings == null ? null : mailSmsSettings!.toJson(),
    "checkpoint_place_id": projectInfoCheckpointPlaceId,
    "terminal_latitude": terminalLatitude,
    "terminal_location": terminalLocation,
    "terminal_longitude": terminalLongitude,
    "terminal_place_id": terminalPlaceId,
    "project_terminals": projectTerminals == null ? null : List<dynamic>.from(projectTerminals!.map((x) => x)),
    "organization_name": organizationName == null ? null : organizationName,
  };
}

class MailSmsSettings {
  MailSmsSettings({
    required this.mail,
    required this.sms,
  });

  bool mail;
  bool sms;

  factory MailSmsSettings.fromJson(Map<String, dynamic> json) => MailSmsSettings(
    mail: json["mail"] == null ? null : json["mail"],
    sms: json["sms"] == null ? null : json["sms"],
  );

  Map<String, dynamic> toJson() => {
    "mail": mail == null ? null : mail,
    "sms": sms == null ? null : sms,
  };
}

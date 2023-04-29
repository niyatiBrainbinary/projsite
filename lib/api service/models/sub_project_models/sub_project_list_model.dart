// To parse this JSON data, do
//
//     final subProjectListModel = subProjectListModelFromJson(jsonString);

import 'dart:convert';

SubProjectListModel subProjectListModelFromJson(String str) => SubProjectListModel.fromJson(json.decode(str));

String subProjectListModelToJson(SubProjectListModel data) => json.encode(data.toJson());

class SubProjectListModel {
  bool? success;
  List<SubProject>? subProjects;
  ProjectInfo? projectInfo;

  SubProjectListModel({
    this.success,
    this.subProjects,
    this.projectInfo,
  });

  factory SubProjectListModel.fromJson(Map<String, dynamic> json) => SubProjectListModel(
    success: json["success"],
    subProjects: json["sub_projects"] == null ? [] : List<SubProject>.from(json["sub_projects"]!.map((x) => SubProject.fromJson(x))),
    projectInfo: json["project_info"] == null ? null : ProjectInfo.fromJson(json["project_info"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "sub_projects": subProjects == null ? [] : List<dynamic>.from(subProjects!.map((x) => x.toJson())),
    "project_info": projectInfo?.toJson(),
  };
}

class ProjectInfo {
  String? id;
  String? projectName;
  String? organizationId;
  String? projectLocation;
  String? fromDate;
  String? toDate;
  bool? status;
  String? latitude;
  String? longitude;
  DateTime? updatedAt;
  DateTime? createdAt;
  ProjectSettings? projectSettings;
  dynamic mailSmsSettings;
  String? wasteLogoId;
  bool? hasLogisticsModule;
  bool? hasShipmentModule;
  String? placeId;
  String? checkpoint;
  String? checkpointLocation;
  String? checkpointLatitude;
  String? checkpointLongitude;
  String? checkpointPlaceId;
  List<String>? projectTerminals;

  ProjectInfo({
    this.id,
    this.projectName,
    this.organizationId,
    this.projectLocation,
    this.fromDate,
    this.toDate,
    this.status,
    this.latitude,
    this.longitude,
    this.updatedAt,
    this.createdAt,
    this.projectSettings,
    this.mailSmsSettings,
    this.wasteLogoId,
    this.hasLogisticsModule,
    this.hasShipmentModule,
    this.placeId,
    this.checkpoint,
    this.checkpointLocation,
    this.checkpointLatitude,
    this.checkpointLongitude,
    this.checkpointPlaceId,
    this.projectTerminals,
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
    id: json["_id"],
    projectName: json["project_name"],
    organizationId: json["organization_id"],
    projectLocation: json["project_location"],
    fromDate: json["from_date"],
    toDate: json["to_date"],
    status: json["status"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    projectSettings: json["project_settings"] == null ? null : ProjectSettings.fromJson(json["project_settings"]),
    mailSmsSettings: json["mail_sms_settings"],
    wasteLogoId: json["waste_logo_id"],
    hasLogisticsModule: json["has_logistics_module"],
    hasShipmentModule: json["has_shipment_module"],
    placeId: json["place_id"],
    checkpoint: json["checkpoint"],
    checkpointLocation: json["checkpoint_location"],
    checkpointLatitude: json["checkpoint_latitude"],
    checkpointLongitude: json["checkpoint_longitude"],
    checkpointPlaceId: json["checkpoint_placeId"],
    projectTerminals: json["project_terminals"] == null ? [] : List<String>.from(json["project_terminals"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "project_name": projectName,
    "organization_id": organizationId,
    "project_location": projectLocation,
    "from_date": fromDate,
    "to_date": toDate,
    "status": status,
    "latitude": latitude,
    "longitude": longitude,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "project_settings": projectSettings?.toJson(),
    "mail_sms_settings": mailSmsSettings,
    "waste_logo_id": wasteLogoId,
    "has_logistics_module": hasLogisticsModule,
    "has_shipment_module": hasShipmentModule,
    "place_id": placeId,
    "checkpoint": checkpoint,
    "checkpoint_location": checkpointLocation,
    "checkpoint_latitude": checkpointLatitude,
    "checkpoint_longitude": checkpointLongitude,
    "checkpoint_placeId": checkpointPlaceId,
    "project_terminals": projectTerminals == null ? [] : List<dynamic>.from(projectTerminals!.map((x) => x)),
  };
}

class ProjectSettings {
  bool? resource;
  bool? zone;
  bool? contractor;
  bool? responsiblePerson;
  bool? zonesSimultaneously;
  bool? typeOfVehicle;
  bool? vehicleCapacity;
  bool? drivingDistance;
  String? addresses;
  bool? loadWeight;
  bool? deliverySupplier;
  bool? euroClass;
  bool? typeOfFuel;
  bool? subProject;
  bool? autoApproval;
  bool? wasteDisposal;

  ProjectSettings({
    this.resource,
    this.zone,
    this.contractor,
    this.responsiblePerson,
    this.zonesSimultaneously,
    this.typeOfVehicle,
    this.vehicleCapacity,
    this.drivingDistance,
    this.addresses,
    this.loadWeight,
    this.deliverySupplier,
    this.euroClass,
    this.typeOfFuel,
    this.subProject,
    this.autoApproval,
    this.wasteDisposal,
  });

  factory ProjectSettings.fromJson(Map<String, dynamic> json) => ProjectSettings(
    resource: json["resource"],
    zone: json["zone"],
    contractor: json["contractor"],
    responsiblePerson: json["responsible_person"],
    zonesSimultaneously: json["zones_simultaneously"],
    typeOfVehicle: json["type_of_vehicle"],
    vehicleCapacity: json["vehicle_capacity"],
    drivingDistance: json["driving_distance"],
    addresses: json["addresses"],
    loadWeight: json["load_weight"],
    deliverySupplier: json["delivery_supplier"],
    euroClass: json["euro_class"],
    typeOfFuel: json["type_of_fuel"],
    subProject: json["sub_project"],
    autoApproval: json["auto_approval"],
    wasteDisposal: json["waste_disposal"],
  );

  Map<String, dynamic> toJson() => {
    "resource": resource,
    "zone": zone,
    "contractor": contractor,
    "responsible_person": responsiblePerson,
    "zones_simultaneously": zonesSimultaneously,
    "type_of_vehicle": typeOfVehicle,
    "vehicle_capacity": vehicleCapacity,
    "driving_distance": drivingDistance,
    "addresses": addresses,
    "load_weight": loadWeight,
    "delivery_supplier": deliverySupplier,
    "euro_class": euroClass,
    "type_of_fuel": typeOfFuel,
    "sub_project": subProject,
    "auto_approval": autoApproval,
    "waste_disposal": wasteDisposal,
  };
}

class SubProject {
  String? id;
  String? subProjectName;
  String? projectId;
  String? organizationId;
  bool? isDeleted;
  DateTime? updatedAt;
  DateTime? createdAt;

  SubProject({
    this.id,
    this.subProjectName,
    this.projectId,
    this.organizationId,
    this.isDeleted,
    this.updatedAt,
    this.createdAt,
  });

  factory SubProject.fromJson(Map<String, dynamic> json) => SubProject(
    id: json["_id"],
    subProjectName: json["sub_project_name"],
    projectId: json["project_id"],
    organizationId: json["organization_id"],
    isDeleted: json["is_deleted"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sub_project_name": subProjectName,
    "project_id": projectId,
    "organization_id": organizationId,
    "is_deleted": isDeleted,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}

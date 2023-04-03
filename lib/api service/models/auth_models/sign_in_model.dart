
class SignInModel {
  SignInModel({
    this.userInfo,
    this.role,
    this.userOrganization,
    this.token,
    this.success,
    this.error
  });

  UserInfo? userInfo;
  Role? role;
  List<UserOrganization>? userOrganization;
  String? token;
  bool? success;
  Error? error;

  // SignInModel(
  // userInfo: UserInfo.fromJson(json["user_info"]),
  // role: Role.fromJson(json["role"]),
  // userOrganization: List<UserOrganization>.from(
  // json["user_organization"]
  //     .map((x) => UserOrganization.fromJson(x))),
  // token: json["token"],
  // success: json["success"],
  // error: json['error'] == null
  // ? json["error"]
  //     : Error.fromJson(json["error"]),
  // )

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      json['error'] == null
          ? SignInModel(
              userInfo: UserInfo.fromJson(json["user_info"]),
              role: Role.fromJson(json["role"]),
              userOrganization: List<UserOrganization>.from(
                  json["user_organization"]
                      .map((x) => UserOrganization.fromJson(x))),
              token: json["token"],
              success: json["success"],
            )
          : SignInModel(
              error: Error.fromJson(json["error"]),
            );

  Map<String, dynamic> toJson() => {
    "user_info": userInfo,
    "role": role,
    "user_organization": List<dynamic>.from(userOrganization!.map((x) => x.toJson())),
    "token": token,
    "success": success,
    "error": error,
      };
}

class Role {
  Role({
    this.id,
    this.role,
    this.hasManageAccess,
    this.hasApprovalAcccess,
    this.hasCheckpointAccess,
  });

  String? id;
  String? role;
  bool? hasManageAccess;
  bool? hasApprovalAcccess;
  bool? hasCheckpointAccess;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["_id"],
    role: json["role"],
    hasManageAccess: json["has_manage_access"],
    hasApprovalAcccess: json["has_approval_acccess"],
    hasCheckpointAccess: json["has_checkpoint_access"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "role": role,
    "has_manage_access": hasManageAccess,
    "has_approval_acccess": hasApprovalAcccess,
    "has_checkpoint_access": hasCheckpointAccess,
  };
}

class UserInfo {
  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.organizationId,
    // this.updatedAt,
    // this.createdAt,
    this.companyId,
    this.roleId,
    this.isForgotPasswordIntitiated,
    this.language,
    this.locale,
    this.projects,
    this.adminProjects,
    this.isAdmin,
    this.isProjectAdmin,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? organizationId;
  // DateTime? updatedAt;
  // DateTime? createdAt;
  String? companyId;
  String? roleId;
  bool? isForgotPasswordIntitiated;
  String? language;
  String? locale;
  List<String>? projects;
  List<dynamic>? adminProjects;
  bool? isAdmin;
  bool? isProjectAdmin;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    organizationId: json["organization_id"],
    // updatedAt: DateTime.parse(json["updated_at"]),
    // createdAt: DateTime.parse(json["created_at"]),
    companyId: json["company_id"],
    roleId: json["role_id"],
    isForgotPasswordIntitiated: json["is_forgot_password_intitiated"],
    language: json["language"],
    locale: json["locale"],
    projects: List<String>.from(json["projects"].map((x) => x)),
    adminProjects: List<dynamic>.from(json["admin_projects"].map((x) => x)),
    isAdmin: json["is_admin"],
    isProjectAdmin: json["is_project_admin"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "password": password,
    "organization_id": organizationId,
    // "updated_at": updatedAt,
    // "created_at": createdAt,
    "company_id": companyId,
    "role_id": roleId,
    "is_forgot_password_intitiated": isForgotPasswordIntitiated,
    "language": language,
    "locale": locale,
    "projects": List<dynamic>.from(projects!.map((x) => x)),
    "admin_projects": List<dynamic>.from(adminProjects!.map((x) => x)),
    "is_admin": isAdmin,
    "is_project_admin": isProjectAdmin,
  };
}

class UserOrganization {
  UserOrganization({
    this.organizationId,
    this.organizationName,
  });

  String? organizationId;
  String? organizationName;

  factory UserOrganization.fromJson(Map<String, dynamic> json) => UserOrganization(
    organizationId: json["organization_id"],
    organizationName: json["organization_name"],
  );

  Map<String, dynamic> toJson() => {
    "organization_id": organizationId,
    "organization_name": organizationName,
  };
}

class Error {
  Error({
    this.invalidUsernamePassword,
    this.emailEntered,
    this.passwordEntered,
  });

  bool? invalidUsernamePassword;
  String? emailEntered;
  String? passwordEntered;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    invalidUsernamePassword: json["invalid_username_password"],
    emailEntered: json["email_entered"],
    passwordEntered: json["password_entered"],
  );

  Map<String, dynamic> toJson() => {
    "invalid_username_password": invalidUsernamePassword,
    "email_entered": emailEntered,
    "password_entered": passwordEntered,
  };
}




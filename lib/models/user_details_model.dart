class User {
  User({
    this.id,
    this.fullName,
    this.phone,
    this.photo,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.roleId,
    this.yearId,
    this.password,
    this.passwordConfirmation,
    this.roleName,
    this.guardName,
  });

  int id;
  String fullName;
  String phone;
  String photo;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String roleId;
  String yearId;
  String password;
  String passwordConfirmation;
  String roleName;
  String guardName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        phone: json["phone"] == null ? null : json["phone"],
        photo: json["photo"] == null ? null : json["photo"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        roleId: json["role_id"] == null ? null : json["role_id"],
        yearId: json["year_id"] == null ? null : json["year_id"],
        password: json["password"] == null ? null : json["password"],
        passwordConfirmation: json["password_confirmation"] == null
            ? null
            : json["password_confirmation"],
        roleName: json["role_name"] == null ? null : json["role_name"],
        guardName: json["guard_name"] == null ? null : json["guard_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "full_name": fullName == null ? null : fullName,
        "phone": phone == null ? null : phone,
        "photo": photo == null ? null : photo,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "role_id": roleId == null ? null : roleId,
        "year_id": yearId == null ? null : yearId,
        "password": password == null ? null : password,
        "password_confirmation":
            passwordConfirmation == null ? null : passwordConfirmation,
        "role_name": roleName == null ? null : roleName,
        "guard_name": guardName == null ? null : guardName,
      };
}

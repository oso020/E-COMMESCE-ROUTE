import 'package:e_commerce_app/domain/entity_models/SignUpResponseEntity.dart';

/// message : "success"
/// user : {"name":"Maram Hassan","email":"maram.alsoudani@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDE5YTgzOTJhN2EzZGM1N2MxY2Y3MCIsIm5hbWUiOiJNYXJhbSBIYXNzYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTcyNTAxMjYxMiwiZXhwIjoxNzMyNzg4NjEyfQ.UUsgN7gBXk89b1mwjM_CGGVqAPOCxt96cMCvStkDFio"

class SignUpResponseDTO extends SignUpResponseEntity {
  SignUpResponseDTO({super.message, super.user, super.token, super.statusMsg});

  SignUpResponseDTO.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDTO.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
}

/// name : "Maram Hassan"
/// email : "maram.alsoudani@gmail.com"
/// role : "user"

class UserDTO extends UserEntity {
  UserDTO({
    super.name,
    super.email,
    this.role,
  });

  UserDTO.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}

import 'package:e_commerce_app/domain/entity_models/SignInRsponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmQ1MDU2ZWQwZGMwMDE2YzY0ZGNmYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MjAzNTYyLCJleHAiOjE3MzI5Nzk1NjJ9.cW1Su2Yevq0uKlro7jQR6BaiAk8INc2UbEw7HTbesi0"

class SignInResponseDto extends SignInResponseEntity {
  SignInResponseDto({super.message, super.user, super.token, super.statusMsg});

  SignInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? SignInUserDTO.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
//
// SignInUserDTO? user;
//
// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['message'] = message;
//   if (user != null) {
//     map['user'] = user?.toJson();
//   }
//   map['token'] = token;
//   return map;
// }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class SignInUserDTO extends SignInUserEntity {
  SignInUserDTO({
    super.name,
    super.email,
    this.role,
  });

  SignInUserDTO.fromJson(dynamic json) {
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

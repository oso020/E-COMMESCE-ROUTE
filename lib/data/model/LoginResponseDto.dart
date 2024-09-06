import 'package:ecommerce/domain/entites/LoginResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmQ1MDU2ZWQwZGMwMDE2YzY0ZGNmYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MzUyMjk5LCJleHAiOjE3MzMxMjgyOTl9.n-vAyDyCHWg26R_JFfnF52aoibNMGKnnIQkIvxMPUCc"

class LoginResponseDto extends LoginResponseEntity{
  LoginResponseDto({
      super.message,
    super.user,
    super.token,});

  LoginResponseDto.fromJson(dynamic json) {
    statusMsg=json["statusMsg"];
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }




}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class UserDto extends UserEntity {
  UserDto({
      super.name,
    super.email,
    super.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }




}
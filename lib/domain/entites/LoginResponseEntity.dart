/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmQ1MDU2ZWQwZGMwMDE2YzY0ZGNmYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MzUyMjk5LCJleHAiOjE3MzMxMjgyOTl9.n-vAyDyCHWg26R_JFfnF52aoibNMGKnnIQkIvxMPUCc"

class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});


  String? message;
  UserEntity? user;
  String?statusMsg;
  String? token;



}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      this.role,});


  String? name;
  String? email;
  String? role;



}
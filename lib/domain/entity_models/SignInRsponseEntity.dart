/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmQ1MDU2ZWQwZGMwMDE2YzY0ZGNmYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI1MjAzNTYyLCJleHAiOjE3MzI5Nzk1NjJ9.cW1Su2Yevq0uKlro7jQR6BaiAk8INc2UbEw7HTbesi0"

class SignInResponseEntity {
  SignInResponseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  SignInUserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutti@gmail.com"
/// role : "user"

class SignInUserEntity {
  SignInUserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}

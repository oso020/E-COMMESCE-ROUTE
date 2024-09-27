/// message : "success"
/// user : {"name":"Maram Hassan","email":"maram.alsoudani@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDE5YTgzOTJhN2EzZGM1N2MxY2Y3MCIsIm5hbWUiOiJNYXJhbSBIYXNzYW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTcyNTAxMjYxMiwiZXhwIjoxNzMyNzg4NjEyfQ.UUsgN7gBXk89b1mwjM_CGGVqAPOCxt96cMCvStkDFio"

class SignUpResponseEntity {
  SignUpResponseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Maram Hassan"
/// email : "maram.alsoudani@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
